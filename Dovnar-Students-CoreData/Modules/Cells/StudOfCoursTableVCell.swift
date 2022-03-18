//
//  StudOfCoursTableVCell.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 8.02.22.
//

import UIKit

class StudOfCoursTableVCell: UITableViewCell {

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
