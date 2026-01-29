//
//  ViewController.swift
//  TidalCodingAssignment
//
//  Created by Paul McGrath on 1/29/26.
//

import UIKit

class ViewController: UITableViewController {

    var employees: [Employee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        employees.append(Employee(uuid: "1", full_name: "Paul", team: "Team", phone: "093 24366", photo_url_small: nil))
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath)
        guard let employeeCell = cell as? EmployeeTableViewCell else { return cell }
        employeeCell.employee = employees[indexPath.row]
        return employeeCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    

    
    
}

