//
//  AddCourseVC.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 7.02.22.
//

import UIKit

class AddCourseVC: UIViewController {

    
  
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var infoTF: UITextField!

    
    
    @IBAction func cancelDidTap(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveDidTap(_ sender: UIBarButtonItem) {
        guard let name = nameTF.text,
              let info = infoTF.text else { return } // зачем эта проверка?
        guard name != "" else { return }
        
        let newCourse = Course(context: CoreDataService.managedObjectContext)
        newCourse.name = name
        newCourse.info = info
        CoreDataService.saveContext()
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    


}

