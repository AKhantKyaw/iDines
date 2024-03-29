//
//  iDineApp.swift
//  iDine
//
//  Created by Aung Khant Kyaw on 21/06/2023.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
