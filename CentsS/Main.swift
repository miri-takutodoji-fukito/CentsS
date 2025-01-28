//
//  Main.swift
//  CentsS
//
//  Created by Leung Yin on 28/1/25.
//

import SwiftUI

struct Main: View {
    
    @Binding var user: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    @Binding var expense_logs: [expense_item]
    @Binding var savings_logs: [savings_item]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Main(user: .constant(false),
         name: .constant("takudotoji"),
         email: .constant("takudotoji@mail.com"),
         monthly_budget: .constant(1000),
         monthly_expense: .constant(300),
         monthly_savingsTarget: .constant(250))
}
