//
//  AlertView.swift
//  Playground
//
//  Created by Noah Iarrobino on 12/1/25.
//

import SwiftUI

struct AlertView: View {
    
    @State private var code: String = ""
    private var correctCode: String = "123456"
    @State var alert: BottomAlert?
    
    var body: some View {
        BottomAlertView(alert: $alert) {
            VStack {
                OTPInputView(code: $code)
                
                Spacer()
                
                UButton(title: "Check Code") {
                    if code == correctCode {
                        self.alert = .init(type: .successCustom("Correct code!"))
                    } else {
                        self.alert = .init(type: .failCustom("Incorrect code"))
                    }
                }
            }
            .animation(.easeInOut, value: alert)
        }
        .background(Color.background)
    }
}
