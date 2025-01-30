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
    
    @Binding var budgetleft: Double
    
    @Binding var savings: Double
    
    @Binding var pastmonth: Date
    @Binding var currentmonth: Date
    
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    @Binding var expense_logs: [expense_item]
    @Binding var savings_logs: [savings_item]
    
    @State var top_expense: [expense_item] = []
    
    @State private var sheetAddExpns: Bool = false
    @State private var sheetAddSvns: Bool = false
    @State private var sheetProfile: Bool = false
    
    func getTopExpense() -> [expense_item] {
        var value: [expense_item] = []
        value.append(expense_logs[0])
        value.append(expense_logs[1])
        value.append(expense_logs[2])
        return value
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    sheetProfile.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 110)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        HStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("\(name)")
                                        .bold()
                                        .font(.title)
                                    Spacer()
                                }
                                .frame(width: 220)
                                HStack {
                                    Text("\(email)")
                                        .fontWeight(.semibold)
                                        .font(.title2)
                                    Spacer()
                                }
                                .frame(width: 220)
                            }
                            Button {
                                
                            } label: {
                                Image(systemName: "pencil")
                                    .frame(width: 60)
                                    .font(.title)
                            }
                        }
                    }
                }
                HStack {
                    Button {
                        sheetAddExpns.toggle()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 165, height: 50)
                                .background(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .opacity(0.1)
                            Text("Add Expense \(Image(systemName: "plus"))")
                                .bold()
                        }
                    }
                    Button {
                        sheetAddSvns.toggle()
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 165, height: 50)
                                .background(.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 25))
                                .opacity(0.1)
                            Text("Add Savings \(Image(systemName: "square.and.arrow.down"))")
                                .bold()
                        }
                    }
                }
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 110)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("$\(String(budgetleft))")
                                    .bold()
                                    .font(.largeTitle)
                                Spacer()
                            }
                            .frame(width: 300)
                            HStack {
                                Text("Of Budget Left This Month")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                Spacer()
                            }
                            .frame(width: 300)
                        }
                    }
                }
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 110)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        VStack(alignment: .leading) {
                            HStack {
                                Text("$\(String(savings))")
                                    .bold()
                                    .font(.largeTitle)
                                Spacer()
                            }
                            .frame(width: 300)
                            HStack {
                                Text("Saved So Far")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                Spacer()
                            }
                            .frame(width: 300)
                        }
                    }
                }
                NavigationLink {
                    Logs(expense_logs: $expense_logs, savings_logs: $savings_logs)
                } label: {
                    List(top_expense) { topitem in
                        let title = topitem.title
                        let cost = topitem.value
                        HStack {
                            Text("\(title)")
                                .foregroundStyle(.blue)
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("$\(String(format: "%.2f", cost))")
                                .foregroundStyle(.blue)
                                .font(.title3)
                        }
                    }
                    .background(.gray)
                    .frame(width: 370, height: 200)
                }
            }
            .onAppear() {
                pastmonth = currentmonth
                currentmonth = Date()
                let pasmth = Calendar.current.component(.month, from: pastmonth)
                let curmth = Calendar.current.component(.month, from: currentmonth)
                if pasmth != curmth {
                    budgetleft = monthly_budget
                    budgetleft -= monthly_expense
                    expense_logs.append(expense_item(title: "Monthly Expense", value: monthly_expense, date: Date()))
                }
            }
            .onAppear() {
                if expense_logs.count >= 3 {
                    top_expense = getTopExpense()
                } else {
                    top_expense = expense_logs
                }
            }
            .sheet(isPresented: $sheetAddExpns) {
                AddExpense(budgetleft: $budgetleft,
                           expense_logs: $expense_logs)
            }
            .sheet(isPresented: $sheetAddSvns) {
                AddSavings(savings: $savings,
                           savings_logs: $savings_logs)
            }
            .sheet(isPresented: $sheetProfile) {
                Profile(user: $user,
                        name: $name,
                        email: $email,
                        budgetleft: $budgetleft,
                        savings: $savings,
                        monthly_budget: $monthly_budget,
                        monthly_expense: $monthly_expense,
                        monthly_savingsTarget: $monthly_savingsTarget,
                        expense_logs: $expense_logs,
                        savings_logs: $savings_logs)
            }
        }
    }
}

#Preview {
    Main(user: .constant(false),
         name: .constant("takudotoji"),
         email: .constant("takudotoji@mail.com"),
         budgetleft: .constant(1000),
         savings: .constant(400),
         pastmonth: .constant(Date()),
         currentmonth: .constant(Date()),
         monthly_budget: .constant(1000),
         monthly_expense: .constant(300),
         monthly_savingsTarget: .constant(250),
         expense_logs: .constant([expense_item(title: "Lego", value: 50.0, date: Date()),expense_item(title: "Minecraft", value: 12.3, date: Date()),expense_item(title: "Fortnite", value: 19.8, date: Date())]),
         savings_logs: .constant([]))
}
