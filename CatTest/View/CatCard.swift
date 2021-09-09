//
//  CatCard.swift
//  CatTest
//
//  Created by Sergei Volkov on 09.09.2021.
//

import SwiftUI

struct CatCard: View {
    
    @EnvironmentObject var catVM: CatViewModel
    
    let index: Int
    @State private var offset = CGSize.zero
    var completion: ()->()?

    var body: some View {
        Image("cat\(index)")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width - 18 * 2, height: 517, alignment: .center)
            .cornerRadius(16)
            .rotationEffect(.degrees(offset.width < 0 ? Double(offset.width)/5 : 0))
            .offset(x: offset.width < 0 ? offset.width * 3 : 0, y: 0)
            .opacity(offset.width < 0 ? 2 - Double(abs(offset.width / 50)) : 1)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        print(value.translation)
                        offset = value.translation
                    }
                    .onEnded { _ in
                        if offset.width < -100 {
                            completion()
                        } else {
                            withAnimation {
                                offset = .zero
                            }
                            
                        }
                    }
            )
            .onAppear() {
                if catVM.pressButton && index == catVM.cats.count - 1 {
                    defer {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            catVM.cats = catVM.cats.dropLast()
                            catVM.pressButton = false
                        }
                    }
                    withAnimation(.linear(duration: 0.4)) {
                        offset.width = -101
                    }
                }
            }
    }
}

