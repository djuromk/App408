//
//  HomeViewModel.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {

    @Published var currentProject: String = ""
    @Published var invAmount: String = ""
    @Published var invDate: String = ""
    @Published var currentProjPhoto: String = ""
    
    @AppStorage("projectNames") var projectNames: [String] = []
    @Published var projNameForAdd = ""
    
    @Published var projectForAdd: String = ""
    
    @AppStorage("profit") var profit = ""
    @AppStorage("food") var food = ""
    @AppStorage("projects") var projects = ""
    @AppStorage("donations") var donations = ""

    @AppStorage("yourInv") var yourInv: Int = 0
    
    @Published var aprofit = ""
    @Published var adonation = ""
    @Published var afood = ""
    @Published var aprojects = ""
    
    @Published var selectedProjName = ""
    @Published var selectedProjPhoto = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isProjects: Bool = false
    @Published var isDonations: Bool = false
    @Published var isProfit: Bool = false
    @Published var isFoodprint: Bool = false
    @Published var isAddProject: Bool = false
    @Published var isAllProjects: Bool = false

    @Published var investments: [InvModel] = []
    @Published var selectedInvestment: InvModel?

    func addInvestments() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "InvModel", into: context) as! InvModel

        loan.currentProject = currentProject
        loan.invAmount = invAmount
        loan.invDate = invDate
        loan.currentProjPhoto = currentProjPhoto

        CoreDataStack.shared.saveContext()
    }
    
    func fetchInvestments() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<InvModel>(entityName: "InvModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.investments = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.investments = []
        }
    }
}
