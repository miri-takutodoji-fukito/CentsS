//
//  Logs.swift
//  CentsS
//
//  Created by Leung Yin on 28/1/25.
//

import SwiftUI

struct Logs: View {
    
    @Binding var expense_logs: [expense_item]
    @Binding var savings_logs: [savings_item]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    selectedIndex = 0
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 165, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Expenses \(Image(systemName: "bitcoinsign"))")
                            .bold()
                    }
                }
                Button {
                    selectedIndex = 1
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 165, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Savings \(Image(systemName: "square.and.arrow.down"))")
                            .bold()
                    }
                }
            }
            .padding(.top)
            if selectedIndex == 0 {
                List(expense_logs) { log in
                    let date = log.date
                    let cost = log.value
                    HStack {
                        Text("\(date.formatted(date: .abbreviated, time: .omitted))")
                            .foregroundStyle(.blue)
                            .font(.title3)
                        Spacer()
                        Text("$\(String(format: "%.2f", cost))")
                            .foregroundStyle(.blue)
                            .font(.title3)
                    }
                }
            } else {
                List(savings_logs) { log in
                    let date = log.date
                    let cost = log.value
                    HStack {
                        Text("\(date.formatted(date: .abbreviated, time: .omitted))")
                            .foregroundStyle(.blue)
                            .font(.title3)
                        Spacer()
                        Text("$\(String(format: "%.2f", cost))")
                            .foregroundStyle(.blue)
                            .font(.title3)
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    Logs(expense_logs: .constant([expense_item(title: "Lego", value: 50.0, date: Date()),expense_item(title: "Minecraft", value: 12.3, date: Date()),expense_item(title: "Fortnite", value: 19.8, date: Date())]),
         savings_logs: .constant([]))
}
