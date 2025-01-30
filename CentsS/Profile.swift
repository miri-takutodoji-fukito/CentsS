//
//  Profile.swift
//  CentsS
//
//  Created by Leung Yin on 30/1/25.
//

import SwiftUI

struct Profile: View {
    
    @Binding var user: Bool
    @Binding var name: String
    @Binding var email: String
    
    @Binding var budgetleft: Double
    
    @Binding var savings: Double
    
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    @Binding var expense_logs: [expense_item]
    @Binding var savings_logs: [savings_item]
    
    @State private var edit = false
    
    @State private var changebudget = ""
    @State private var changeExpense = ""
    @State private var changeTarget = ""
    
    var body: some View{
        if edit == true {
            VStack {
                Button {
                    if let _ = Double(changebudget) {
                        monthly_budget = Double(changebudget)!
                    }
                    if let _ = Double(changeExpense) {
                        monthly_expense = Double(changeExpense)!
                    }
                    if let _ = Double(changeTarget) {
                        monthly_savingsTarget = Double(changeTarget)!
                    }
                    edit.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Done \(Image(systemName: "checkmark"))")
                            .bold()
                    }
                }
                .padding(.bottom)
                List {
                    Section("Personal Details") {
                        TextField("Name: \(name)", text: $name)
                        TextField("Name: \(email)", text: $email)
                    }
                    Section("General Settings") {
                        TextField("Monthly Budget: $\(String(format: "%.2f", monthly_budget))", text: $changebudget)
                        TextField("Monthly Expense: $\(String(format: "%.2f", monthly_expense))", text: $changeExpense)
                        TextField("Savings Target: $\(String(format: "%.2f", monthly_savingsTarget))", text: $changeTarget)
                    }
                    Section("Danger Zone") {
                        Button("Delete All Data On Device", role: .destructive) {
                            monthly_budget = 0
                            monthly_expense = 0
                            monthly_savingsTarget = 0
                            expense_logs = []
                            savings_logs = []
                            savings = 0
                            budgetleft = 0
                            name = ""
                            email = ""
                            user = false
                        }
                    }
                }
            }
        } else {
            VStack {
                Button {
                    edit.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Edit Details \(Image(systemName: "pencil"))")
                            .bold()
                    }
                }
                .padding(.bottom)
                List {
                    Section("Personal Details") {
                        Text(name)
                        Text(email)
                    }
                    Section("General Settings") {
                        Text("Budget: $\(String(format: "%.2f", monthly_budget))")
                        Text("Monthly Expense: $\(String(format: "%.2f", monthly_expense))")
                        Text("Savings Target: $\(String(format: "%.2f", monthly_savingsTarget))")
                    }
                }
            }
        }
    }
}

#Preview {
    Profile(user: .constant(true),
            name: .constant("takudotoji"),
            email: .constant("takudotoji@gmail.com"),
            budgetleft: .constant(2600),
            savings: .constant(230),
            monthly_budget: .constant(3000),
            monthly_expense: .constant(400),
            monthly_savingsTarget: .constant(300),
            expense_logs: .constant([]),
            savings_logs: .constant([]))
}
