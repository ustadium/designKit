//
//  Untitled.swift
//  UstadiumDesignKit
//
//  Created by Noah Iarrobino on 1/9/26.
//

import SwiftUI

public extension View {
    func horizontalPadding() -> some View {
        self
            .padding(.horizontal, 16)
    }
    
    func maxSize() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func maxWidth(_ width: CGFloat = .infinity) -> some View {
        self
            .frame(maxWidth: width)
    }
    
    func maxHeight(_ height: CGFloat = .infinity) -> some View {
        self
        .frame(maxHeight: height)
    }
    
    func height(height: CGFloat,  _ alignment: Alignment = .center) -> some View {
        self
            .frame(height: height, alignment: alignment)
    }
    
    func width(width: CGFloat,  _ alignment: Alignment = .center) -> some View {
        self
            .frame(width: width, alignment: alignment)
    }
    
    func dimensions(width: CGFloat, height: CGFloat,  _ alignment: Alignment = .center) -> some View {
        self
            .frame(width: width, height: height, alignment: alignment)
    }
}


public extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
}

extension View {
    @ViewBuilder
    func `modifyIf`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

