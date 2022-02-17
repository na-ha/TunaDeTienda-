//
//  TiendaDeTunaApp.swift
//  TiendaDeTuna
//
//  Created by MacMini on 2/16/22.
//

import SwiftUI

@main
struct TiendaDeTunaApp: App {
    var order = OrderViewModel()
    var items = [TunaModel]()
    var body: some Scene {
        
        WindowGroup {
            ContentView(items:items)
                .environmentObject(order)

        }
    }
}
