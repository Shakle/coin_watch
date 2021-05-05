//
//  RunnerApp.swift
//  coinwatch WatchKit Extension
//
//  Created by Dima on 05.05.2021.
//

import SwiftUI

@main
struct RunnerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
