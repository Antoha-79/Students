//
//  AddStudOfCourseVC.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 9.02.22.
//

import UIKit
import CoreData

class AddStudOfCourseVC: UIViewController {
    
    
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var avrScoreTF: UITextField!
    @IBOutlet weak var courseNameTF: UITextField!
    
    var currentCourseName: String!
    var currentCourse: Course!
    
  /*
    @IBAction func cancelDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    } */
    
      @IBAction func saveDidTap(_ sender: UIBarButtonItem) {
        guard let lastname = lastnameTF.text,
              let name = nameTF.text else { return } // зачем эта проверка? - все равно сохраняет пустые, а не выбрасывает как требует того return
        guard ((name != "") || (lastname != "")) else { return } // не позволяет сохранить студента без имени
          
        // сохраняем нового студента
        let newStudent = Student(context: CoreDataService.managedObjectContext)
        newStudent.lastname = lastname
        newStudent.name = name
        newStudent.avrgScore = Double(avrScoreTF.text ?? "0") ?? 0.0
        newStudent.course = currentCourse
        CoreDataService.saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let request = Course.fetchRequest()
        if let courses = try? CoreDataService.managedObjectContext.fetch(request) {
            currentCourse = courses.first(where: { $0.name == currentCourseName })!
        }
        
        courseNameTF.text = currentCourseName
    }

}


extension AddStudOfCourseVC: NSFetchedResultsControllerDelegate {

}
