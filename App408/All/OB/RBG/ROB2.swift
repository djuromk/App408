//
//  ROB2.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI

struct ROB2: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("rbg2")
                    .resizable()
            }
            
            VStack {
                
                HStack {
                    
                    Circle()
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primaryy"))
                        .frame(width: 8, height: 8)

                    Circle()
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                .padding()
                
                Text("Collect all project in one place")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    ROB3()
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
    ROB2()
}
