//
//  Subway_GeneratorApp.swift
//  Subway-Generator
//
//  Created by Nathan Kent on 3/2/21.
//

import SwiftUI

@main
struct Subway_GeneratorApp: App {
    @StateObject var generator = Generator()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(generator)
        }
    }
}
