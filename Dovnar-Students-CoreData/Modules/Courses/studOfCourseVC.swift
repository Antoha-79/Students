//
//  studOfCourseVC.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 7.02.22.
//

import UIKit

class studOfCourseVC: UIViewController {

    @IBOutlet weak var studentsOfCourseTV: UITableView!
    
     var studentsOfCourse: [Student]!
     var titleName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentsOfCourseTV.dataSource = self
        studentsOfCourseTV.delegate = self
        
        title = titleName
    }
    
    @IBAction func addNewStudent(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "AddStudOfCourseVC") as! AddStudOfCourseVC
        nextVC.currentCourseName = title
        //present(nextVC, animated: true, completion: nil)
        
        navigationController?.pushViewController(nextVC, animated: true)
    }


}



extension studOfCourseVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsOfCourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudOfCoursTableVCell", for: indexPath) as! StudOfCoursTableVCell
        cell.setup(student: studentsOfCourse[indexPath.row])
        
        return cell
    }
}
