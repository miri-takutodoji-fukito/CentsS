//
//  AddSheets.swift
//  CentsS
//
//  Created by Leung Yin on 28/1/25.
//

import SwiftUI

struct AddExpense: View {
    
    @Binding var budgetleft: Double
    @Binding var expense_logs: [expense_item]
    
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var date: Date = Date()
    
    @State private var val: expense_item = expense_item(title: "", value: 0, date: Date())
    
    @Environment(\.dismiss) var Dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 330, height: 540)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .opacity(0.1)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Add A New Expense Log")
                            .bold()
                            .font(.title3)
                        Spacer()
                    }
                    .frame(width: 300)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                        TextField("Title", text: $title)
                            .frame(width: 270, height: 30)
                            .padding(10)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                        HStack {
                            TextField("Valid Value", text: $amount)
                                .frame(width: 235, height: 30)
                                .padding(10)
                            if let _ = Double(amount), Double(amount)! > 0 {
                                Text("\(Image(systemName: "checkmark.circle"))")
                                    .foregroundStyle(.green)
                                    .font(.title2)
                            } else {
                                Text("\(Image(systemName: "xmark.circle"))")
                                    .foregroundStyle(.red)
                                    .font(.title2)
                            }
                        }
                    }
                    .padding(.top, 2)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 300, height: 320)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .frame(width: 300, height: 320)
                    }
                }
            }
            if !title.isEmpty, let _ = Double(amount), Double(amount)! > 0 {
                Button {
                    val = expense_item(title: title, value: Double(amount)!, date: date)
                    expense_logs.append(val)
                    budgetleft -= Double(amount)!
                    Dismiss()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Add To Expenses \(Image(systemName: "plus"))")
                            .bold()
                    }
                }
                .padding(.top)
            } else {
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Add To Expenses \(Image(systemName: "plus"))")
                            .bold()
                    }
                }
                .padding(.top)
                .disabled(true)
                .opacity(0.7)
            }
        }
    }
}

struct AddSavings: View {
    
    @Binding var savings: Double
    @Binding var savings_logs: [savings_item]
    
    @State private var amount: String = ""
    @State private var date: Date = Date()
    
    @State private var val: savings_item = savings_item(value: 0, date: Date())
    
    @Environment(\.dismiss) var Dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 330, height: 500)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .opacity(0.1)
                VStack(alignment: .leading) {
                    HStack {
                        Text("Add A New Savings Log")
                            .bold()
                            .font(.title3)
                        Spacer()
                    }
                    .frame(width: 300)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 300, height: 50)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                        HStack {
                            TextField("Valid Value", text: $amount)
                                .frame(width: 235, height: 30)
                                .padding(10)
                            if let _ = Double(amount), Double(amount)! > 0 {
                                Text("\(Image(systemName: "checkmark.circle"))")
                                    .foregroundStyle(.green)
                                    .font(.title2)
                            } else {
                                Text("\(Image(systemName: "xmark.circle"))")
                                    .foregroundStyle(.red)
                                    .font(.title2)
                            }
                        }
                    }
                    .padding(.top, 2)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 300, height: 320)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .frame(width: 300, height: 320)
                    }
                }
            }
            if let _ = Double(amount), Double(amount)! > 0 {
                Button {
                    savings += Double(amount)!
                    savings_logs.append(savings_item(value: Double(amount)!, date: date))
                    Dismiss()
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Add To Savings \(Image(systemName: "plus"))")
                            .bold()
                    }
                }
                .padding(.top)
            } else {
                Button {
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: 330, height: 50)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .opacity(0.1)
                        Text("Add To Savings \(Image(systemName: "plus"))")
                            .bold()
                    }
                }
                .padding(.top)
                .disabled(true)
                .opacity(0.7)
            }
        }
    }
}

//#Preview {
//    AddExpense(budgetleft: .constant(1000), expense_logs: .constant([expense_item(title: "Lego", value: 50.0, date: Date()),expense_item(title: "Minecraft", value: 12.3, date: Date()),expense_item(title: "Fortnite", value: 19.8, date: Date())]))
//}

#Preview {
    AddSavings(savings: .constant(300),
               savings_logs: .constant([]))
}
