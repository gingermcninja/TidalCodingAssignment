//
//  Employee.swift
//  TidalCodingAssignment
//
//  Created by Paul McGrath on 1/29/26.
//

import Foundation

nonisolated
struct EmployeeResponse: Codable {
    var employees: [Employee] = []
}

struct Employee: Codable, Identifiable {
    var id: String { uuid }
    let uuid: String
    let full_name: String
    let team: String
    let phone_number: String
    let photo_url_small: String
}
