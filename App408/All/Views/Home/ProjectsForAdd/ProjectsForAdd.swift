//
//  ProjectsForAdd.swift
//  App408
//
//  Created by DJUROM on 04/04/2024.
//

import SwiftUI

struct ProjectsForAdd: View {
    
    @StateObject var viewModel = ProjectsViewModel()
    @StateObject var mainModel: HomeViewModel
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
                    
                    if viewModel.projects.isEmpty {
                        
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
                                
                                ForEach(viewModel.projects, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        mainModel.selectedProjName = index.projName ?? ""
                                        mainModel.selectedProjPhoto = index.projPhoto ?? ""
                                        
                                        withAnimation(.spring()) {
                                            
                                            mainModel.isAddProject = false
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Image(index.projPhoto ?? "")
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                            
                                            VStack(alignment: .leading, spacing: 8) {
                                                
                                                Text(index.projCategory ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 12, weight: .regular))
                                                
                                                Text(index.projName ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .semibold))
                                                
                                                Text(index.projDescription ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                    .multilineTextAlignment(.leading)
                                                    .lineLimit(1)
                                            }
                                            
                                            Spacer()
                                            
                                            Text("$\(index.projGoal ?? "")")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .semibold))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                                    })
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
            
            viewModel.fetchProjects()
        }
    }
}

#Preview {
    ProjectsForAdd(mainModel: HomeViewModel())
}
