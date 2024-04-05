//
//  ROB1.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI

struct ROB1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("rbg1")
                    .resizable()
            }
            
            VStack {
                
                HStack {
                    
                    Circle()
                        .fill(Color("primaryy"))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                .padding()
                
                Text("Explore your portfolio")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    ROB2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    ROB1()
}
