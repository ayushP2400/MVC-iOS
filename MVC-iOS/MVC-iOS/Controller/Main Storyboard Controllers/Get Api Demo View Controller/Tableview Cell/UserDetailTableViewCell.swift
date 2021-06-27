//
//  UserDetailTableViewCell.swift
//  MVC-iOS
//
//  Created by love on 27/06/21.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var empIDLbl: UILabel!
    @IBOutlet weak var empNameLbl: UILabel!
    @IBOutlet weak var empAgeLbl: UILabel!
    @IBOutlet weak var empSalaryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(with userDetails: UserDetail) {
        empIDLbl.text = "\(userDetails.id)"
        empNameLbl.text = userDetails.employeeName
        empAgeLbl.text = "\(userDetails.employeeAge)"
        empSalaryLbl.text = "\(userDetails.employeeSalary)"        
    }
}
