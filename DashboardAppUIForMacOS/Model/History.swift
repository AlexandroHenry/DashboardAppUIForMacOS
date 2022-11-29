//
//  History.swift
//  DashboardAppUIForMacOS
//
//  Created by Seungchul Ha on 2022/11/29.
//

import SwiftUI

// Sample History Model and Data...
struct History: Identifiable {
    
    var id = UUID().uuidString
    var image: String
    var description: String
    var time: String
    var amount: String
}

var histories: [History] = [
    History(image: "building.columns", description: "Loan", time: "10:39 PM", amount: "$320"),
    History(image: "laptopcomputer", description: "MacBook Pro", time: "11:39 PM", amount: "$2200"),
    History(image: "wifi", description: "Google", time: "08:39 AM", amount: "$120")
]
