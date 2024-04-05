//
//  CalculatorViewModel.swift
//  App408
//
//  Created by DJUROM on 02/04/2024.
//

import SwiftUI
import CoreData

final class CalculatorViewModel: ObservableObject {

    @Published var calDate: Date = Date()
    @Published var calInterest: String = ""
    @Published var calReplen: String = ""
    @Published var calBalance: String = ""

    @Published var fbal = "\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))"
    @Published var tint = "\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))"
    @Published var trep = "\(String(format: "%.f", Double(.random(in: 1...9)))).\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))"
    
    @Published var periodsForAdd: [String] = ["every year", "every month", "every week", "every day"]
    @Published var currentRepPer = ""
    @Published var currentIntPer = ""

    @Published var information = ""
    @Published var initialamount = ""
    @Published var replenishmentAmount = ""
    @Published var replenishmentPeriod = ""
    @Published var interPerc = ""
    @Published var interPeriod = ""
    @Published var years = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isResult: Bool = false
    @Published var isCalculate: Bool = false

    @Published var calculations: [CalcModel] = []
    @Published var selectedCalculation: CalcModel?

    func addCalculation() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CalcModel", into: context) as! CalcModel

        loan.calDate = calDate
        loan.calInterest = calInterest
        loan.calReplen = calReplen
        loan.calBalance = calBalance

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCalcularions() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CalcModel>(entityName: "CalcModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.calculations = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.calculations = []
        }
    }
}
