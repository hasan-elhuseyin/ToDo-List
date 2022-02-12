//
//  TaskCell.swift
//  ToDo-List
//
//  Created by Hasan Elhussein on 10.02.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    // IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var completionDate: UILabel!
    @IBOutlet weak var completionTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
