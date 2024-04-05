//
//  InvestmentsAll.swift
//  App408
//
//  Created by DJUROM on 04/04/2024.
//

import SwiftUI

struct InvestmentsAll: View {
    
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var geri
    
    var body: some View {
        
        ZStack {
            
            Color("primaryy")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Investments")
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
                    
                    if viewModel.investments.isEmpty {
                        
                        VStack(spacing: 10) {
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("You don’t have any projects yet")
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .regular))
                        }
                        .frame(maxHeight: .infinity)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
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
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .ignoresSafeArea()
            }
        }
        .onAppear {
            
            viewModel.fetchInvestments()
        }
    }
}

#Preview {
    InvestmentsAll()
}
