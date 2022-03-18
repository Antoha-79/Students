//
//  CoursesVC.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//

import UIKit
import CoreData


class CoursesVC: UIViewController, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var coursesTV: UITableView!
    
private var allCourses = [Course]() {
        didSet {
            coursesTV.reloadData()
    }
}

    var titleName: String!
    
    @IBAction func addNewCourse(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let nextVC = storyboard.instantiateViewController(identifier: "AddCourseNC") as! AddCourseNC
        present(nextVC, animated: true, completion: nil)
        
        //navigationController?.pushViewController(nextVC, animated: true)
    }

    
    private var fetchedResultController: NSFetchedResultsController<Course>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coursesTV.dataSource = self
        coursesTV.delegate = self
        
        setupFetchedResultController()
        loadAllCourses()
        
        title = titleName
      
        
        // print([allCourses])  //- проверял сколько дублей набралось )
    }
    
    private func setupFetchedResultController() {
        let request = NSFetchRequest<Course>(entityName: "Course")
       // let request = Course.fetchRequest() // - можно и так
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        fetchedResultController = NSFetchedResultsController<Course>(fetchRequest: request, managedObjectContext: CoreDataService.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        }
    

    private func loadAllCourses() {
        
        try? fetchedResultController.performFetch()

        if let results = fetchedResultController.fetchedObjects {
            allCourses = results
        }
        
    }
    //каждый раз когда что-то поменялось в базе - перепоказывается таблица
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        loadAllCourses()
    }

}


extension CoursesVC: UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableViewCell", for: indexPath) as! CoursesTableViewCell
        cell.setup(cuorse: allCourses[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "studOfCourseVC") as! studOfCourseVC
        let titleText = allCourses[indexPath.row].name
        nextVC.titleName = titleText

    var tempArray: [Student] = []
        
        // test
            var fetchedResultControllerStud: NSFetchedResultsController<Student>!
            
            let request = Student.fetchRequest()
            let sortDescriptor = NSSortDescriptor(key: "lastname", ascending: true)
            request.sortDescriptors = [sortDescriptor]
            fetchedResultControllerStud = NSFetchedResultsController<Student>(fetchRequest: request, managedObjectContext: CoreDataService.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            fetchedResultControllerStud.delegate = self
            
            try? fetchedResultControllerStud.performFetch()

            if let results = fetchedResultControllerStud.fetchedObjects {
                for stud in results {
                    if stud.course?.name == allCourses[indexPath.row].name  {
                        tempArray.append(stud)
                    }
                }
            }
//print(tempArray)
        nextVC.studentsOfCourse = tempArray
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}
