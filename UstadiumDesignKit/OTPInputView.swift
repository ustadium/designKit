//
//  OTPInputView.swift
//  UstadiumDesignKit
//
//  Created by Noah Iarrobino on 12/1/25.
//

import SwiftUI

public struct OTPInputView: View {
    @Binding var code: String
    var length: Int = 6
    var isSecure: Bool = false
    var onComplete: (String) -> Void = { _ in }

    @State private var internalText: String = ""
    @FocusState private var isFocused: Bool
    
    public init(
        code: Binding<String>,
        length: Int = 6,
        isSecure: Bool = false,
        onComplete: @escaping (String) -> Void,
        internalText: String = ""
    ) {
        self._code = code
        self.length = length
        self.isSecure = isSecure
        self.onComplete = onComplete
        self.internalText = internalText
     }

    public var body: some View {
        ZStack {
            // Hidden text field that receives input and supports autofill
            TextField("", text: $internalText)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .focused($isFocused)
                .onChange(of: internalText) { _, newValue in
                    let filtered = newValue.filter(\.isNumber).prefix(length)

                    if internalText != filtered {
                        internalText = String(filtered)
                    }

                    code = String(filtered)

                    if code.count == length {
                        onComplete(code)
                    }
                }
                .frame(width: 1, height: 1)     // must be non-zero for focus
                .opacity(0.01)
                .allowsHitTesting(false)

            // Visible boxes
            HStack(spacing: 12) {
                ForEach(0..<length, id: \.self) { idx in
                    let char = character(at: idx)

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .background(DesignTokens.Colors.textFieldBackground)

                        RoundedRectangle(cornerRadius: 10)
                            .stroke(
                                isFocused && currentIndex == idx
                                ? Color.blue.opacity(0.9)
                                    : Color.clear,
                                lineWidth: 2
                            )

                        Text(display(char))
                            .font(.system(size: 24, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)
                    }
                    .frame(width: 48, height: 56)
                    .contentShape(Rectangle())
                    .onTapGesture { isFocused = true }
                }
            }
        }
        .task {
            // Auto-focus on appear
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                isFocused = true
            }
        }
        .onAppear {
            internalText = code.filter(\.isNumber).prefix(length).toString()
        }
        .onTapGesture {
            isFocused = true
        }
    }

    // MARK: - Helpers

    private var currentIndex: Int {
        min(internalText.count, length - 1)
    }

    private func character(at index: Int) -> Character? {
        guard index < internalText.count else { return nil }
        let i = internalText.index(internalText.startIndex, offsetBy: index)
        return internalText[i]
    }

    private func display(_ c: Character?) -> String {
        guard let c else { return "" }
        return isSecure ? "•" : String(c)
    }
}

// MARK: - Extensions

private extension StringProtocol {
    func toString() -> String { String(self) }
}
