//
//  CoursesTableViewCell.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 7.02.22.
//
import UIKit
import CoreData

class CoursesTableViewCell: UITableViewCell, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    

    func setup(cuorse: Course) {
        nameLabel.text = cuorse.name
        
    }
    
/*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
*/
 
}
