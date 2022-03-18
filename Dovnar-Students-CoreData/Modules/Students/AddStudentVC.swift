//
//  AddStudentVC.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//

import UIKit
import CoreData

class AddStudentVC: UIViewController {
   
    
    
    
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var avrScoreTF: UITextField!
    @IBOutlet weak var courseNameTF: UITextField!
    
    
    private var coursePicker: UIPickerView!
    var currentCourse: Course!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveDidTap(_ sender: UIBarButtonItem) {
        guard let lastname = lastnameTF.text,
              let name = nameTF.text else { return } // зачем эта проверка?
        guard ((name != "") || (lastname != "")) else { return } // не позволяет сохранить студента без имени
            
        // сохраняем нового студента
        let newStudent = Student(context: CoreDataService.managedObjectContext)
        newStudent.lastname = lastname
        newStudent.name = name
        newStudent.avrgScore = Double(avrScoreTF.text ?? "0") ?? 0.0
        newStudent.course = currentCourse
        CoreDataService.saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coursePicker = UIPickerView()
        coursePicker.delegate = self
        coursePicker.dataSource = self
    
        courseNameTF.inputView = coursePicker

    }
    

}


extension AddStudentVC: UIPickerViewDelegate, UIPickerViewDataSource, NSFetchedResultsControllerDelegate {
   
    func arrayOfCourses() -> [Course] {
        var tempArray: [Course] = []
                var fetchedResultController: NSFetchedResultsController<Course>!
                
                let request = Course.fetchRequest()
                let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
                request.sortDescriptors = [sortDescriptor]
        fetchedResultController = NSFetchedResultsController<Course>(fetchRequest: request, managedObjectContext: CoreDataService.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
                
                try? fetchedResultController.performFetch()

                if let results = fetchedResultController.fetchedObjects {
                    for course in results {
                            tempArray.append(course)
                    }
                }
        return tempArray
    }

public func numberOfComponents(in pickerView: UIPickerView) -> Int{
    return 1
}

public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
    return arrayOfCourses().count
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //self.view.endEditing(true)
    return arrayOfCourses()[row].name
}




func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.courseNameTF.text = arrayOfCourses()[row].name
    currentCourse = arrayOfCourses()[row]
    coursePicker.isHidden = false
    

}

}
