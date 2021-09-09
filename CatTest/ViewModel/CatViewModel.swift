//
//  CatViewModel.swift
//  CatTest
//
//  Created by Sergei Volkov on 09.09.2021.
//

import SwiftUI

class CatViewModel: ObservableObject {
    @Published var cats = Settings.catData
    @Published var pressButton = false {
        didSet {
            if pressButton {
                refreshID = UUID()
            }
        }
    }
    @Published var refreshID = UUID()
}
