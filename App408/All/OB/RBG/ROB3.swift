//
//  ROB3.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI

struct ROB3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("rbg3")
                    .resizable()
            }
            
            VStack {
                
                HStack {
                    
                    Circle()
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 8, height: 8)
   
                    Circle()
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 8, height: 8)
                    
                    Circle()
                        .fill(Color("primaryy"))
                        .frame(width: 8, height: 8)

                }
                .padding()
                
                Text("Calculate everything you need!")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 290)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    ROB3()
}
