//
//  ResultView.swift
//  App408
//
//  Created by DJUROM on 03/04/2024.
//

import SwiftUI

struct ResultView: View {
    
    @StateObject var viewModel: CalculatorViewModel
    @Environment(\.presentationMode) var geri
    
    var body: some View {

        ZStack {
            
            Color("primaryy")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Result")
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
                
                VStack(spacing: 12) {
                    
                    Text("Final balance")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    
                    Text("$\(viewModel.fbal)")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    Text("Total replenishments")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    
                    Text("$\(viewModel.trep)")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    Text("Total interest")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    
                    Text("$\(viewModel.tint)")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                   Spacer()
                    
                    Button(action: {
                        
                        viewModel.calInterest = viewModel.tint
                        viewModel.calBalance = viewModel.fbal
                        viewModel.calReplen = viewModel.trep
                        
                        viewModel.addCalculation()
                        
                        viewModel.calInterest = ""
                        viewModel.calBalance = ""
                        viewModel.calReplen = ""
                        
                        viewModel.fetchCalcularions()
                        
                        geri.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                    })
                    .padding()
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ResultView(viewModel: CalculatorViewModel())
}
