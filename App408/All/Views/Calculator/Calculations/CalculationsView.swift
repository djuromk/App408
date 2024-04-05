//
//  CalculationsView.swift
//  App408
//
//  Created by DJUROM on 03/04/2024.
//

import SwiftUI

struct CalculationsView: View {
    
    @StateObject var viewModel: CalculatorViewModel
    @Environment(\.presentationMode) var geri
    
    var body: some View {
        
        ZStack {
            
            Color("primaryy")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Calculations")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            geri.wrappedValue.dismiss()

                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                   
                            }
                        })
                        
                    }
                }
                .padding()
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.calculations, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedCalculation = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(spacing: 12) {
                                            
                                            Text((index.calDate ?? Date())
                                                .convertDate(format: "MMM d HH:mm"))
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                            
                                            Text("Calculate")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                                })
                                .padding()
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .ignoresSafeArea()
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            CalcDetail(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchCalcularions()
        }
    }
}

#Preview {
    CalculationsView(viewModel: CalculatorViewModel())
}
