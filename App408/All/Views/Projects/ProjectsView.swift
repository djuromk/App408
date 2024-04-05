//
//  ProjectsView.swift
//  App408
//
//  Created by DJUROM on 03/04/2024.
//

import SwiftUI

struct ProjectsView: View {
    
    @StateObject var viewModel = ProjectsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("primaryy")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Projects")
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 18) {
                        
                        ForEach(viewModel.projects, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedProject = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
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
                                    
                                    Text(index.projGoal ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                            })
                        }
                    }
                    .padding(.top)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                .ignoresSafeArea()
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                })
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchProjects()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ProjInfo(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddProject(viewModel: viewModel)
        })
    }
}

#Preview {
    ProjectsView()
}
