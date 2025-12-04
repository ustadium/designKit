//
//  Alert.swift
//  UstadiumDesignKit
//
//  Created by Noah Iarrobino on 11/24/25.
//

import SwiftUI


struct PositionAlertView<Content: View, AlertContent: View>: View {
    @Binding var alert: AlertContent?
    let content: Content
    
    init(
        alert: Binding<AlertContent?>,
        position: Edge = .bottom,
        @ViewBuilder content: () -> Content
    ) {
        self._alert = alert
        self.edge = position
        self.content = content()
    }
    
    private let edge: Edge
    
    var body: some View {
        ZStack {
            content
            
            VStack {
                if edge == .bottom {
                    Spacer()
                }
                if let alert = alert {
                    alert
                        .transition(.move(edge: edge).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    self.alert = nil
                                }
                            }
                        }
                }
                
                if edge == .top {
                    Spacer()
                }
            }
            .padding(.bottom, 20)
        }
    }
}

public struct BottomAlert: View, Equatable {
    public static func == (lhs: BottomAlert, rhs: BottomAlert) -> Bool {
        lhs.message == rhs.message
    }
    
    var type: BottomAlertType
    
    public init(type: BottomAlertType) {
        self.type = type
    }
    
    var message: String {
        type.info.0
    }
    
    var image: String {
        type.info.1
    }
    
    public var body: some View {
        HStack(alignment: .center) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.trailing, 8)
                .padding(.leading, 20)
            
            Text(message)
            
            Spacer()
        }
        .frame(height: 50)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 16)
        )
        .shadow(color: Color.black.opacity(0.15), radius: 10)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

public enum BottomAlertType {
    case success
    case failure
    case failCustom(String)
    case successCustom(String)

    var info: (String, String) {
        switch self {
        case .success:
            return (BottomAlertConstants.successMessage, BottomAlertConstants.successImage)
        case .failure:
            return (BottomAlertConstants.failureMessage, BottomAlertConstants.failureImage)
        case .failCustom(let msg):
            return (msg, BottomAlertConstants.failureImage)
        case .successCustom(let msg):
            return (msg, BottomAlertConstants.successImage)
        }
    }
}

public class BottomAlertConstants {
    static var successMessage: String = "Success"
    static var failureMessage: String = "Failure"
    
    static var successImage: String = "checkmark"
    static var failureImage: String = "xmark"
    
    static var alertColor: Color = Color.init(uiColor: .systemBackground).opacity(0.9)
}


