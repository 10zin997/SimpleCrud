//
//  SimpleCrudApp.swift
//  SimpleCrud
//
//  Created by Tenzin wangyal on 7/8/22.
//

import SwiftUI

@main
struct SimpleCrudApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(coreDM: CoreDataManager())
        }
    }
}
