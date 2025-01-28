//
//  Activation.swift
//  CentsS
//
//  Created by Leung Yin on 28/1/25.
//

import SwiftUI

struct Activation: View {
    
    @Binding var user: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("Welcome to")
                        .font(.title2)
                        .padding(3)
                    Text("Cents$")
                        .font(.system(size: 56))
                        .fontWeight(.heavy)
                        .bold()
                    Text("Easy Budgeting")
                        .font(.title2)
                        .bold()
                }
                Spacer()
                NavigationLink("Activate \(Image(systemName: "arrow.right"))") {
                    Activation2(user: $user,
                                name: $name,
                                email: $email,
                                monthly_budget: $monthly_budget,
                                monthly_expense: $monthly_expense,
                                monthly_savingsTarget: $monthly_savingsTarget)
                        .navigationBarBackButtonHidden()
                }
                .padding()
                .frame(width: 220, height: 40)
                .background(.pink)
                .foregroundStyle(.white)
                .bold()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

struct Activation2: View {
    
    @Binding var user: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("1.")
                        .font(.system(size: 56))
                        .fontWeight(.heavy)
                    Text("Set-Up")
                        .font(.title2)
                        .bold()
                    Text("Details")
                        .font(.title2)
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 270, height: 50)
                                .foregroundStyle(.gray)
                                .opacity(0.5)
                            TextField("A Nickname", text: $name)
                                .frame(width: 250, height: 30)
                                .padding(10)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 270, height: 50)
                                .foregroundStyle(.gray)
                                .opacity(0.5)
                            TextField("Your Email", text: $email)
                                .frame(width: 250, height: 30)
                                .padding(10)
                        }
                    }
                    .padding()
                }
                Spacer()
                NavigationLink("Continue \(Image(systemName: "arrow.right"))") {
                    Activation3(user: $user,
                                name: $name,
                                email: $email,
                                monthly_budget: $monthly_budget,
                                monthly_expense: $monthly_expense,
                                monthly_savingsTarget: $monthly_savingsTarget)
                        .navigationBarBackButtonHidden()
                }
                .padding()
                .frame(width: 220, height: 40)
                .background(.pink)
                .foregroundStyle(.white)
                .bold()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

struct Activation3: View {
    
    @Binding var user: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    
    @State private var setBudget = "3000"

    func set() {
        monthly_budget = Double(setBudget)!
//        print(monthly_budget)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("2.")
                        .font(.system(size: 56))
                        .fontWeight(.heavy)
                    Text("Set-Up")
                        .font(.title2)
                        .bold()
                    Text("Budgeting")
                        .font(.title2)
                    Text("Set a budget for each month")
                        .font(.title2)
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.bottom)
                    Text("*can be changed later")
                        .font(.headline)
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 270, height: 50)
                                .foregroundStyle(.gray)
                                .opacity(0.5)
                                HStack {
                                    TextField("A Valid Number", text: $setBudget)
                                        .frame(width: 200, height: 30)
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                    if let _ = Double(setBudget) {
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
                    }
                    .padding()
                }
                Spacer()
                if let _ = Double(setBudget) {
                    NavigationLink("Continue \(Image(systemName: "arrow.right"))") {
                        Activation4(user: $user,
                                    name: $name,
                                    email: $email,
                                    monthly_budget: $monthly_budget,
                                    monthly_expense: $monthly_expense,
                                    monthly_savingsTarget: $monthly_savingsTarget)
                            .navigationBarBackButtonHidden()
                            .onAppear{self.set()}
                    }
                    .padding()
                    .frame(width: 220, height: 40)
                    .background(.pink)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    NavigationLink("Continue \(Image(systemName: "arrow.right"))") {
                        
                    }
                    .padding()
                    .frame(width: 220, height: 40)
                    .background(.pink)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(0.6)
                    .disabled(true)
                }
            }
        }
    }
}

struct Activation4: View {
    
    @Binding var user: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    
    @State private var setExpense = "450"

    func set() {
        monthly_expense = Double(setExpense)!
//        print(monthly_budget)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("3.")
                        .font(.system(size: 56))
                        .fontWeight(.heavy)
                    Text("Set-Up")
                        .font(.title2)
                        .bold()
                    Text("Default Expenses")
                        .font(.title2)
                    Text("Include your bills automatically each month")
                        .font(.title2)
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.bottom)
                    Text("*can be changed later")
                        .font(.headline)
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 270, height: 50)
                                .foregroundStyle(.gray)
                                .opacity(0.5)
                                HStack {
                                    TextField("A Valid Number", text: $setExpense)
                                        .frame(width: 200, height: 30)
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                    if let _ = Double(setExpense) {
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
                    }
                    .padding()
                }
                Spacer()
                if let _ = Double(setExpense) {
                    NavigationLink("Continue \(Image(systemName: "arrow.right"))") {
                        Activation5(user: $user,
                                    name: $name,
                                    email: $email,
                                    monthly_budget: $monthly_budget,
                                    monthly_expense: $monthly_expense,
                                    monthly_savingsTarget: $monthly_savingsTarget)
                            .navigationBarBackButtonHidden()
                            .onAppear{self.set()}
                    }
                    .padding()
                    .frame(width: 220, height: 40)
                    .background(.pink)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    NavigationLink("Continue \(Image(systemName: "arrow.right"))") {
                        
                    }
                    .padding()
                    .frame(width: 220, height: 40)
                    .background(.pink)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(0.6)
                    .disabled(true)
                }
            }
        }
    }
}

struct Activation5: View {
    
    @Binding var user: Bool
    @Binding var name: String
    @Binding var email: String
    @Binding var monthly_budget: Double
    @Binding var monthly_expense: Double
    @Binding var monthly_savingsTarget: Double
    
    @State private var setGoal = "320"

    func set() {
        monthly_savingsTarget = Double(setGoal)!
//        print(monthly_budget)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("4.")
                        .font(.system(size: 56))
                        .fontWeight(.heavy)
                    Text("Set-Up")
                        .font(.title2)
                        .bold()
                    Text("Savings")
                        .font(.title2)
                    Text("Want something but don't want a hole in your pocket? Set a savings goal!")
                        .font(.title2)
                        .frame(width: 250)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.bottom)
                    Text("*can be changed later")
                        .font(.headline)
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 270, height: 50)
                                .foregroundStyle(.gray)
                                .opacity(0.5)
                                HStack {
                                    TextField("A Valid Number", text: $setGoal)
                                        .frame(width: 200, height: 30)
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                    if let _ = Double(setGoal) {
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
                    }
                    .padding()
                }
                Spacer()
                if let _ = Double(setGoal) {
                    NavigationLink("Finish Set Up \(Image(systemName: "arrow.right"))") {
                        Activation6(user: $user,
                                    name: $name)
                            .navigationBarBackButtonHidden()
                            .onAppear{self.set()}
                    }
                    .padding()
                    .frame(width: 220, height: 40)
                    .background(.pink)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                } else {
                    NavigationLink("Finish Set Up \(Image(systemName: "arrow.right"))") {
                        
                    }
                    .padding()
                    .frame(width: 220, height: 40)
                    .background(.pink)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(0.6)
                    .disabled(true)
                }
            }
        }
    }
}

struct Activation6: View {
    
    @Binding var user: Bool
    @Binding var name: String
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("Welcome to Cents$")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Spacer()
                    Button("Complete \(Image(systemName: "checkmark"))") {
                        user = true
                    }
                    .padding()
                    .frame(width: 220, height: 40)
                    .background(.pink)
                    .foregroundStyle(.white)
                    .bold()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

#Preview {
    Activation(user: .constant(false),
               name: .constant("takudotoji"),
               email: .constant("takudotoji@mail.com"),
               monthly_budget: .constant(1000),
               monthly_expense: .constant(300),
               monthly_savingsTarget: .constant(250))
}
