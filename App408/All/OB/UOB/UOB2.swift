//
//  UOB2.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI
import StoreKit

struct UOB2: View {
    var body: some View {

        ZStack {
            
            Color("ubg")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("reviews")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color("primaryy").opacity(0.5))
                        .frame(width: 68, height: 5)
                    
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color("primaryy"))
                        .frame(width: 68, height: 5)
      
                }
                .padding()
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(Color("primaryy"))
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 350)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 6)
                
                Text("Be your own trainer!")
                    .foregroundColor(Color("primaryy"))
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    UOB3()
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    UOB2()
}
