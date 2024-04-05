//
//  HomeView.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("primaryy")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Home")
                        .foregroundColor(.black)
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                    })
                }
                .padding()
                
                VStack(spacing: 12) {
                    
                    VStack {
                        
                        Text("Total amount of your")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("investments")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    if viewModel.investments.isEmpty {
                        
                        VStack (alignment: .leading, spacing: 8) {
                            
                            Text("Current Profit")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("$\(viewModel.yourInv)")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 140)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                        .overlay (
                            
                            VStack {
                                
                                Spacer()
                                
                                Image("minusgraph")
                            }
                        )
                        
                    } else {
                        
                        VStack (alignment: .leading, spacing: 8) {
                            
                            Text("Current Profit")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                            
                            Text("$\(viewModel.profit)")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .semibold))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 140)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                        .overlay (
                            
                            VStack {
                                
                                Spacer()
                                
                                Image("plusgraph")
                            }
                        )
                    }
                    
                    Text("Statistics")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfit = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chart.line.uptrend.xyaxis")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(width: 70, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text("Current Profit")
                                        .foregroundColor(.black)
                                        .font(.system(size: 11, weight: .regular))
                                    
                                    Text("$\(viewModel.profit)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy").opacity(0.6)))
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDonations = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chart.bar.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(width: 70, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text("Sum of Donations")
                                        .foregroundColor(.black)
                                        .font(.system(size: 11, weight: .regular))
                                    
                                    Text("$\(viewModel.donations)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy").opacity(0.6)))
                        })
                    }
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProjects = true
                                
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "list.clipboard.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(width: 70, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text("Projects")
                                        .foregroundColor(.black)
                                        .font(.system(size: 11, weight: .regular))
                                    
                                    Text("$\(viewModel.projects)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy").opacity(0.6)))
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isFoodprint = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "tree.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                    .frame(width: 70, height: 80)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    
                                    Text("Carbon Footprint")
                                        .foregroundColor(.black)
                                        .font(.system(size: 11, weight: .regular))
                                    
                                    Text("$\(viewModel.food)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy").opacity(0.6)))
                        })
                    }
                    
                    HStack {
                        
                        Text("History of investments")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAllProjects = true
                            }
                            
                        }, label: {
                            
                            Text("see all")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                        })
                        
                    }
                    
                    if viewModel.investments.isEmpty {
                        
                        VStack {
                            
                            
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack(spacing: 8) {
                                
                                ForEach(viewModel.investments, id: \.self) { index in
                                    
                                    HStack {
                                        
                                        Image(index.currentProjPhoto ?? "")
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                        
                                        VStack(alignment: .leading, spacing: 12) {
                                            
                                            Text(index.invDate ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                            
                                            Text(index.currentProject ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("$\(index.invAmount ?? "")")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .ignoresSafeArea()
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isProfit ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isProfit  = false
                        }
                    }
                
                VStack {
                    
                    Text("Current profit")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.aprofit.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.aprofit)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.profit = viewModel.aprofit
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isProfit = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                            .padding()
                    })
                    .opacity(viewModel.aprofit.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.aprofit.isEmpty ? true : false)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .frame(height: 400)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isProfit  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDonations ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDonations  = false
                        }
                    }
                
                VStack {
                    
                    Text("Sum of donations")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.adonation.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.adonation)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.donations = viewModel.adonation
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDonations = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                            .padding()
                    })
                    .opacity(viewModel.adonation.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.adonation.isEmpty ? true : false)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .frame(height: 400)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isDonations  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isProjects ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isProjects  = false
                        }
                    }
                
                VStack {
                    
                    Text("Projects")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.aprojects.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.aprojects)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.projects = viewModel.aprojects
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isProjects = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                            .padding()
                    })
                    .opacity(viewModel.aprojects.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.aprojects.isEmpty ? true : false)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .frame(height: 400)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isProjects  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isFoodprint ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isFoodprint  = false
                        }
                    }
                
                VStack {
                    
                    Text("Carbon footprint")
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.afood.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.afood)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.food = viewModel.afood
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isFoodprint = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 55)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color.black))
                            .padding()
                    })
                    .opacity(viewModel.afood.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.afood.isEmpty ? true : false)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .frame(height: 400)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isFoodprint  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchInvestments()
        }
        .sheet(isPresented: $viewModel.isAllProjects, content: {
            
            InvestmentsAll()
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddInvestment(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
