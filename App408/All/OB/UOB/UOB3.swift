//
//  UOB3.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI
import OneSignalFramework

struct UOB3: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("ubg")
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("notific")
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
                .opacity(0)
                
                Text("Don’t miss anything")
                    .foregroundColor(Color("primaryy"))
                    .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 6)
                
                Text("Don’t miss the most userful information")
                    .foregroundColor(Color("primaryy"))
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                        status = true
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 0/255, green: 122/255, blue: 205/255)))
                        .padding()
                })
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                            .padding(6)
                            .background(Circle().fill(.white.opacity(0.3)))
                            .padding()
                    })
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    UOB3()
}
