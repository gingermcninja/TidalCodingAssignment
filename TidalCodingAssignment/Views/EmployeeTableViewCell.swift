//
//  EmployeeTableViewCell.swift
//  TidalCodingAssignment
//
//  Created by Paul McGrath on 1/29/26.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    var employee: Employee? = nil {
        didSet
        {
            nameLabel?.text = employee?.full_name
            teamLabel?.text = employee?.team
            phoneLabel?.text = employee?.phone_number
        }
    }
    
    @IBOutlet var photoImageView: UIImageView?
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var teamLabel: UILabel?
    @IBOutlet var phoneLabel: UILabel?
}
