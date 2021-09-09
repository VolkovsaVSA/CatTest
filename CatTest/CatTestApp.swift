//
//  CatTestApp.swift
//  CatTest
//
//  Created by Sergei Volkov on 09.09.2021.
//

import SwiftUI

@main
struct CatTestApp: App {
    
    let catVM = CatViewModel()
    
    var body: some Scene {
        WindowGroup {
            CatView()
                .environmentObject(catVM)
        }
    }
}
