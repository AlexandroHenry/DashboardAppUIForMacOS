//
//  DashboardAppUIForMacOSApp.swift
//  DashboardAppUIForMacOS
//
//  Created by Seungchul Ha on 2022/11/29.
//

import SwiftUI

@main
struct DashboardAppUIForMacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Removing Textfield ring..
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { return .none }
        set {}
    }
}
