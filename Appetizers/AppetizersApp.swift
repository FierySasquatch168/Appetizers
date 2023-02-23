//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 21.02.2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
