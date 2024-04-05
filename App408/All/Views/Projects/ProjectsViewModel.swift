//
//  ProjectsViewModel.swift
//  App408
//
//  Created by DJUROM on 03/04/2024.
//

import SwiftUI
import CoreData

final class ProjectsViewModel: ObservableObject {
    
    @Published var photos: [String] = ["Green Energy Fund", "Clean Water Initiative"]
    @Published var currentPhoto = ""
    
    @AppStorage("projectNames") var projectNames: [String] = []

    @Published var projName: String = ""
    @Published var projDescription: String = ""
    @Published var projGoal: String = ""
    @Published var projPhoto: String = ""
    @Published var projCategory: String = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var projects: [ProjectModel] = []
    @Published var selectedProject: ProjectModel?

    func addProject() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ProjectModel", into: context) as! ProjectModel

        loan.projName = projName
        loan.projDescription = projDescription
        loan.projGoal = projGoal
        loan.projPhoto = projPhoto
        loan.projCategory = projCategory

        CoreDataStack.shared.saveContext()
    }
    
    func fetchProjects() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProjectModel>(entityName: "ProjectModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.projects = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.projects = []
        }
    }
}
