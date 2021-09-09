//
//  Settings.swift
//  CatTest
//
//  Created by Sergei Volkov on 09.09.2021.
//

import SwiftUI

struct Settings {
    static let mainColor = Color(.sRGB, red: 0.19, green: 0.42, blue: 1, opacity: 1)
    static var catData = Array(0...7).map {"cat\($0.description)"}
}
