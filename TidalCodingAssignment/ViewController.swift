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
        Task {
            await loadEmployees()
        }
    }
    
    private func loadEmployees() async {
        do {
            employees = try await NetworkManager.shared.fetchEmployees()
            self.tableView.reloadData()
        }
        catch {
            self.diaplayErrorAlert(error: error)
        }
    }
    
    func diaplayErrorAlert(error: Error) {
        let alert = UIAlertController(title:"Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
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

    @IBAction func refreshData(_ sender: UIRefreshControl) {
        Task {
            await loadEmployees()
            sender.endRefreshing()
        }
    }
}

