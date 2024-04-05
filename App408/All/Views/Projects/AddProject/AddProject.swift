//
//  AddProject.swift
//  App408
//
//  Created by DJUROM on 03/04/2024.
//

import SwiftUI

struct AddProject: View {
    
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
                    
                    Text("Add project")
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
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Menu(content: {
                        
                        ForEach(viewModel.photos, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentPhoto = index
                                
                            }, label: {
                                
                             Text(index)
                                
                            })
                        }
                        
                    }, label: {
                        
                        if viewModel.currentPhoto.isEmpty {
                            
                            Image(systemName: "photo")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .regular))
                                .frame(width: 100, height: 100)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primaryy")))
                                .padding()
                            
                        } else {
                            
                            Image(viewModel.currentPhoto)
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(6)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primaryy")))
                                .padding()
                        }
                    })
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.projName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.projName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Category")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.projCategory.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.projCategory)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.bottom)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Goal")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.projGoal.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.projGoal)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Description")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.projDescription.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.projDescription)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                }
                
                Button(action: {

                    viewModel.projectNames.append(viewModel.projName)
                    
                    viewModel.projPhoto = viewModel.currentPhoto
                    
                    viewModel.addProject()
                    
                    viewModel.projName = ""
                    viewModel.projDescription = ""
                    viewModel.projCategory = ""
                    viewModel.projGoal = ""
                    viewModel.projPhoto = ""
                    viewModel.currentPhoto = ""
                                        
                    viewModel.fetchProjects()
                                        
                    geri.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                })
                .disabled(viewModel.currentPhoto.isEmpty || viewModel.projName.isEmpty || viewModel.projDescription.isEmpty || viewModel.projCategory.isEmpty || viewModel.projGoal.isEmpty ? true : false)
                .opacity(viewModel.currentPhoto.isEmpty || viewModel.projName.isEmpty || viewModel.projDescription.isEmpty || viewModel.projCategory.isEmpty || viewModel.projGoal.isEmpty ? 0.5 : 1)
            }
            .padding()
        }
    }
}

#Preview {
    AddProject(viewModel: ProjectsViewModel())
}
