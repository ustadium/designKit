//
//  TextViews.swift
//  Playground
//
//  Created by Noah Iarrobino on 11/28/25.
//

import SwiftUI

struct TextViews: View {
    var body: some View {
        VStack {
            UText("Normal Body")
            
            UText("Bold Body")
                .fontWeight(.bold)
            
            UText("Font size 30")
                .fontSize(30)
        }
    }
}

