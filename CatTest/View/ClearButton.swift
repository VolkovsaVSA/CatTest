//
//  qqq.swift
//  CatTest
//
//  Created by Sergei Volkov on 09.09.2021.
//

import SwiftUI

struct ClearButton: ViewModifier {
    @Binding var text: String
   
    public func body(content: Content) -> some View {
        HStack {
            content
            Button(action: {
                self.text = ""
            }) {
                Text("+")
                    .font(.system(size: 30, weight: .thin, design: .default))
                    .foregroundColor(.black)
                    .rotationEffect(.init(degrees: 45))
            }
        }
    }
}
