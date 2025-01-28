//
//  ContentView.swift
//  CentsS
//
//  Created by Leung Yin on 27/1/25.
//

import SwiftUI
import SwiftPersistence

struct expense_item: Decodable, Encodable {
    var title: String
    var value: Double
    var date: Date
}
struct savings_item: Decodable, Encodable {
    var value: Double
    var date: Date
}

struct ContentView: View {
    
    @AppStorage("user") var user: Bool = false
    @AppStorage("name") var name: String = ""
    @AppStorage("email") var email: String = ""
    
    @Persistent("") var monthly_budget: Double = 0
    @Persistent("") var monthly_expense: Double = 0
    @Persistent("") var monthly_savingsTarget: Double = 0
    @Persistent("") var expense_logs: [expense_item] = []
    @Persistent("") var savings_logs: [savings_item] = []
    
    var body: some View {
        if user {
            Main(user: $user,
                 name: $name,
                 email: $email,
                 monthly_budget: $monthly_budget,
                 monthly_expense: $monthly_expense,
                 monthly_savingsTarget: $monthly_savingsTarget,
                 expense_logs: $expense_logs,
                 savings_logs: $savings_logs)
        } else {
            Activation(user: $user,
                       name: $name,
                       email: $email,
                       monthly_budget: $monthly_budget,
                       monthly_expense: $monthly_expense,
                       monthly_savingsTarget: $monthly_savingsTarget)
        }
    }
}

#Preview {
    ContentView()
}
