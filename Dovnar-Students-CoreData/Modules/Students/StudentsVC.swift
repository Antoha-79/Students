//
//  StudentsVC.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//

import UIKit
import CoreData


class StudentsVC: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var studentsTV: UITableView!
    

 private var allStudents = [Student]() {
     didSet {
         studentsTV.reloadData()
 }
}

    var titleName: String!
    
    @IBAction func addNewStudent(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let nextVC = storyboard.instantiateViewController(identifier: "AddStudentNC") as! AddStudentNC
        present(nextVC, animated: true, completion: nil)
        
        //navigationController?.pushViewController(nextVC, animated: true)
    }

   
    private var fetchedResultController: NSFetchedResultsController<Student>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentsTV.dataSource = self
        studentsTV.delegate = self
        
        setupFetchedResultController()
        loadAllStudents()
        
        allStudents.forEach {print("\($0.lastname), \($0.course?.name)")} // проверка сколько студентов в базе
        
        title = titleName
    
    }
    
    private func setupFetchedResultController() {
        let request = NSFetchRequest<Student>(entityName: "Student")
       // let request = Student.fetchRequest() // - можно и так
        let sortDescriptor1 = NSSortDescriptor(key: "lastname", ascending: true)
        let sortDescriptor2 = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor1, sortDescriptor2]
        fetchedResultController = NSFetchedResultsController<Student>(fetchRequest: request, managedObjectContext: CoreDataService.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        }
    

    private func loadAllStudents() {
        
        try? fetchedResultController.performFetch()

        if let results = fetchedResultController.fetchedObjects {
            allStudents = results
        }
        
    }
    //каждый раз когда что-то поменялось в базе - перепоказывается таблица
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        loadAllStudents()
    }

}


extension StudentsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsTableViewCell", for: indexPath) as! StudentsTableViewCell
        cell.setup(student: allStudents[indexPath.row])
        
        return cell
    }
}
