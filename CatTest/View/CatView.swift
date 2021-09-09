//
//  ContentView.swift
//  CatTest
//
//  Created by Sergei Volkov on 09.09.2021.
//

import SwiftUI

struct CatView: View {

    @EnvironmentObject var catVM: CatViewModel
    @State private var searchText = "cat"
    
    var body: some View {
        
        VStack(spacing: 26) {
            TextField("search", text: $searchText)
                .modifier(ClearButton(text: $searchText))
                .frame(height: 47)
                .padding(.horizontal, 17)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Settings.mainColor,lineWidth: 2))
            
            ZStack {
                if catVM.cats.isEmpty {
                    CatCard(index: 100) {}
                } else {
                    ForEach(0..<catVM.cats.count, id: \.self) { index in
                        CatCard(index: index) {
                            catVM.cats.remove(at: index)
                        }
                    }
                    .id(catVM.refreshID)
                }
                
            }
            
            Button(action: {
                catVM.pressButton = true
            }, label: {
                Text("NEXT")
                    .font(Font.custom("SF Pro Text", size: 24))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 18 * 2, height: 54, alignment: .center)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(catVM.cats.isEmpty ? Color.gray : Settings.mainColor)
                    )
            })
            .disabled(catVM.cats.isEmpty)
            
        }
        .frame(width: UIScreen.main.bounds.width - 18 * 2, height: 54, alignment: .center)

    }
}
