//
//  AddInvestment.swift
//  App408
//
//  Created by DJUROM on 04/04/2024.
//

import SwiftUI

struct AddInvestment: View {

    @StateObject var viewModel: HomeViewModel
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
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                 Button(action: {
                     
                     withAnimation(.spring()) {
                         
                         viewModel.isAddProject = true
                     }
                     
                 }, label: {
                     
                     if viewModel.selectedProjName.isEmpty {
                         
                         HStack {
                             
                             Text("Project")
                                 .foregroundColor(.black)
                                 .font(.system(size: 14, weight: .regular))
                             
                             Spacer()
                             
                             Image(systemName: "chevron.right")
                                 .foregroundColor(.black)
                                 .font(.system(size: 14, weight: .regular))
                         }
                         
                     } else {
                         
                         HStack {
                             
                             Text(viewModel.selectedProjName)
                                 .foregroundColor(.black)
                                 .font(.system(size: 14, weight: .regular))
                             
                             Spacer()
                             
                             Image(systemName: "chevron.right")
                                 .foregroundColor(.black)
                                 .font(.system(size: 14, weight: .regular))
                         }
                     }
                 })
                 .padding()
                 .frame(maxWidth: .infinity)
                 .frame(height: 50)
                 .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.invAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.invAmount)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Date")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.invDate.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.invDate)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("primaryy")))
                    .padding(.bottom)
                }
                
                Button(action: {

                    viewModel.currentProject = viewModel.selectedProjName
                    viewModel.currentProjPhoto = viewModel.selectedProjPhoto
                    
                    viewModel.yourInv += Int(viewModel.invAmount) ?? 0
                    
                    viewModel.addInvestments()
                    
                    viewModel.invAmount = ""
                    viewModel.invDate = ""
                    viewModel.selectedProjName = ""
                    viewModel.selectedProjPhoto = ""
                    
                    viewModel.fetchInvestments()
                                        
                    geri.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.black))
                })
                .disabled(viewModel.selectedProjName.isEmpty || viewModel.selectedProjPhoto.isEmpty || viewModel.invAmount.isEmpty || viewModel.invDate.isEmpty ? true : false)
                .opacity(viewModel.selectedProjName.isEmpty || viewModel.selectedProjPhoto.isEmpty || viewModel.invAmount.isEmpty || viewModel.invDate.isEmpty ? 0.5 : 1)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAddProject, content: {
            
            ProjectsForAdd(mainModel: viewModel)
        })
    }
}

#Preview {
    AddInvestment(viewModel: HomeViewModel())
}
