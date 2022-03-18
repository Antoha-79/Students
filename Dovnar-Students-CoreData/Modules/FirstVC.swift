//
//  FirstVC.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//

import UIKit

class FirstVC: UIViewController {
    
    
    @IBAction private func showAllCourses() {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "CoursesVC") as! CoursesVC
        nextVC.titleName = "List of Courses"
       navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction private func showAllStudents() {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "StudentsVC") as! StudentsVC
        nextVC.titleName = "List of Students"
       navigationController?.pushViewController(nextVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }    

}
