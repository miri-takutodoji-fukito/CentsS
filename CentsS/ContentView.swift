//
//  ContentView.swift
//  CentsS
//
//  Created by Leung Yin on 27/1/25.
//

import SwiftUI
import SwiftPersistence

struct expense_item: Decodable, Encodable, Identifiable {
    var id = UUID()
    var title: String
    var value: Double
    var date: Date
}
struct savings_item: Decodable, Encodable, Identifiable {
    var id = UUID()
    var value: Double
    var date: Date
}

struct ContentView: View {
    
    @AppStorage("user") var user: Bool = false
    @AppStorage("name") var name: String = ""
    @AppStorage("email") var email: String = ""
    
    @AppStorage("budgetleft") var budgetleft: Double = 0
    
    @AppStorage("savings") var savings: Double = 0
    
    @AppStorage("pastmonth") var pastmonth: Date = Date()
    @AppStorage("currentmonth") var currentmonth: Date = Date()
    
    @Persistent("monthly_budget") var monthly_budget: Double = 0
    @Persistent("monthly_expense") var monthly_expense: Double = 0
    @Persistent("monthly_savingsTarget") var monthly_savingsTarget: Double = 0
    @Persistent("expense_logs") var expense_logs: [expense_item] = []
    @Persistent("savings_logs") var savings_logs: [savings_item] = []
    
    var body: some View {
        if user {
            Main(user: $user,
                 name: $name,
                 email: $email,
                 budgetleft: $budgetleft,
                 savings: $savings,
                 pastmonth: $pastmonth,
                 currentmonth: $currentmonth,
                 monthly_budget: $monthly_budget,
                 monthly_expense: $monthly_expense,
                 monthly_savingsTarget: $monthly_savingsTarget,
                 expense_logs: $expense_logs,
                 savings_logs: $savings_logs)
        } else {
            Activation(user: $user,
                       name: $name,
                       email: $email,
                       budgetleft: $budgetleft,
                       monthly_budget: $monthly_budget,
                       monthly_expense: $monthly_expense,
                       monthly_savingsTarget: $monthly_savingsTarget)
        }
    }
}

#Preview {
    ContentView()
}
