//
//  CalculatorView.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {

        ZStack {
            
            Color("primaryy")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calculator")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 18) {
                    
                    HStack {
                        
                        Text("Step 1:")
                            .foregroundColor(Color("primaryy"))
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Information")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name of calculation")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.information.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.information)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    HStack {
                        
                        Text("Step 2:")
                            .foregroundColor(Color("primaryy"))
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Initial amount")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                    }
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("0")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.initialamount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.initialamount)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    HStack {
                        
                        Text("Step 3:")
                            .foregroundColor(Color("primaryy"))
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Replenishment")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Amount")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.replenishmentAmount.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.replenishmentAmount)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Periodicity")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.periodsForAdd, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentRepPer = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentRepPer.isEmpty {
                                    
                                    HStack(content: {
                                        
                                        Text("Choose period")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                    
                                } else {
                                    
                                    HStack(content: {
                                        
                                        Text(viewModel.currentRepPer)
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                }
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                        }
                    }
                    
                    HStack {
                        
                        Text("Step 4:")
                            .foregroundColor(Color("primaryy"))
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Interest accrual")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Amount")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.interPerc.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.interPerc)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Periodicity")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.periodsForAdd, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentIntPer = index
                                        
                                    }, label: {
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentIntPer.isEmpty {
                                    
                                    HStack(content: {
                                        
                                        Text("Choose period")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                    
                                } else {
                                    
                                    HStack(content: {
                                        
                                        Text(viewModel.currentIntPer)
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.up.chevron.down")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                    })
                                }
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                        }
                    }
                    
                    HStack {
                        
                        Text("Step 5:")
                            .foregroundColor(Color("primaryy"))
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("Number of years")
                            .foregroundColor(Color.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                    }
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("0")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.years.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.years)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.bottom, 60)
                    
                }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
//                .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    NavigationLink(destination: {
                        
                        CalculationsView(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                    })
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isResult = true
                        }
                        
                    }, label: {
                        
                        Text("Calculate")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                    })
                    .disabled(viewModel.information.isEmpty || viewModel.initialamount.isEmpty || viewModel.replenishmentAmount.isEmpty || viewModel.currentRepPer.isEmpty || viewModel.interPerc.isEmpty || viewModel.currentIntPer.isEmpty || viewModel.years.isEmpty ? true : false)
                    .opacity(viewModel.information.isEmpty || viewModel.initialamount.isEmpty || viewModel.replenishmentAmount.isEmpty || viewModel.currentRepPer.isEmpty || viewModel.interPerc.isEmpty || viewModel.currentIntPer.isEmpty || viewModel.years.isEmpty ? 0.5 : 1)
                }
                .padding()
            }
        }
        .sheet(isPresented: $viewModel.isCalculate, content: {
            
            CalcDetail(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isResult, content: {
            
            ResultView(viewModel: viewModel)
        })
    }
}

#Preview {
    CalculatorView()
}
