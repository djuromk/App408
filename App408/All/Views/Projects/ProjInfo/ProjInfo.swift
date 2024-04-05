//
//  ProjInfo.swift
//  App408
//
//  Created by DJUROM on 03/04/2024.
//

import SwiftUI

struct ProjInfo: View {

    @StateObject var viewModel: ProjectsViewModel
    @Environment(\.presentationMode) var geri
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                    .padding()
                
                ZStack {
                    
                    Text(viewModel.selectedProject?.projName ?? "")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            geri.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                                .padding(4)
                                .background(Circle().fill(.gray.opacity(0.5)))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .regular))
                        })
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {

                    Image(viewModel.selectedProject?.projPhoto ?? "")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primaryy")))
                                .padding()
                        
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text(viewModel.selectedProject?.projName ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text(viewModel.selectedProject?.projCategory ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.bottom)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text(viewModel.selectedProject?.projGoal ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text(viewModel.selectedProject?.projDescription ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))

                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteProj(withProjName: viewModel.selectedProject?.projName ?? "", completion: {
                            
                            viewModel.fetchProjects()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Cancel")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ProjInfo(viewModel: ProjectsViewModel())
}
