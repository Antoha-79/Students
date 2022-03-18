//
//  StudentsTableViewCell.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//

import UIKit
import CoreData

class StudentsTableViewCell: UITableViewCell { //}, NSFetchedResultsControllerDelegate  {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    /*
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

*/
    func setup(student: Student) {
        lastNameLabel.text = student.lastname
        nameLabel.text = student.name
        
    }

}
