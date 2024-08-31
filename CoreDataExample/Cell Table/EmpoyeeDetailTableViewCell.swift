//
//  EmpoyeeDetailTableViewCell.swift
//  CoreDataExample
//
//  Created by Apple on 31/08/24.
//

import UIKit

class EmpoyeeDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var EmployeeEmaillbl: UILabel!
    @IBOutlet weak var EmployeeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
