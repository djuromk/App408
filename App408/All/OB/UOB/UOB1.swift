//
//  UOB1.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI

struct UOB1: View {
    var body: some View {

        ZStack {
            
            Color("ubg")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("ubg1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color("primaryy"))
                        .frame(width: 68, height: 5)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 68, height: 5)
                }
                .padding()
                
                Text("Buy and take profit")
                    .foregroundColor(Color("primaryy"))
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 6)
                
                Text("Buy and take profit")
                    .foregroundColor(Color("primaryy"))
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    UOB2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 0/255, green: 122/255, blue: 205/255)))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    UOB1()
}
