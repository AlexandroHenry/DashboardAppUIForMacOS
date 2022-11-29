//
//  Analytics.swift
//  DashboardAppUIForMacOS
//
//  Created by Seungchul Ha on 2022/11/29.
//

import SwiftUI

// Analytics Model....
struct Analytics: Identifiable {
    
    var id = UUID().uuidString
    var spend: CGFloat
    var weekDay: String
}

var analyticsData: [Analytics] = [
    Analytics(spend: 500, weekDay: "Mon"),
    Analytics(spend: 240, weekDay: "Tue"),
    Analytics(spend: 350, weekDay: "Wed"),
    Analytics(spend: 430, weekDay: "Thu"),
    Analytics(spend: 690, weekDay: "Fri"),
    Analytics(spend: 540, weekDay: "Sat"),
    Analytics(spend: 920, weekDay: "Sun")
]


