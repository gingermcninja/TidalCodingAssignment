//
//  TidalCodingAssignmentTests.swift
//  TidalCodingAssignmentTests
//
//  Created by Paul McGrath on 1/29/26.
//

import Testing
import Foundation
@testable import TidalCodingAssignment

class TidalCodingAssignmentTests {

    @Test("Decodes Employee JSON")
    func testDecodeEmployee() throws {
        guard let employeeJsonFilepath = Bundle(for: type(of: self)).path(forResource: "employee", ofType: "json"),
            let json = NSData(contentsOfFile: employeeJsonFilepath) as? Data else {
            Issue.record("employee json file is empty")
            return
        }
            
        let decoder = JSONDecoder.tidalapi
        let employee = try decoder.decode(Employee.self, from: json)
        #expect(employee.full_name == "Paul McGrath")
        #expect(employee.team == "Development")
        #expect(employee.phone_number == "123456")
    }

    @Test("Decodes EmployeeResponse JSON")
    func testDecodeEmployeeResponse() throws {
        guard let employeeResponseJsonFilepath = Bundle(for: type(of: self)).path(forResource: "employeeList", ofType: "json"),
            let json = NSData(contentsOfFile: employeeResponseJsonFilepath) as? Data else {
            Issue.record("employeeList json file is empty")
            return
        }
            
        let decoder = JSONDecoder.tidalapi
        let employeeResponse = try decoder.decode(EmployeeResponse.self, from: json)
        #expect(employeeResponse.employees.count == 11)
        
        #expect(employeeResponse.employees.first?.full_name == "Justine Mason")
        #expect(employeeResponse.employees.first?.team == "Point of Sale")
        #expect(employeeResponse.employees.first?.phone_number == "5553280123")
        
        #expect(employeeResponse.employees.last?.full_name == "Jack Dorsey")
        #expect(employeeResponse.employees.last?.team == "Core")
        #expect(employeeResponse.employees.last?.phone_number == "5554544932")

    }
    
    @MainActor @Test("Loads employee data")
    func testLoad() async throws {
        let nm = NetworkManager.shared
        let employees = try await nm.fetchEmployees()
        #expect(employees.count == 11)
    }

    @MainActor @Test("Loads malformed data")
    func testMalformedDataLoad() async throws {
        let networkManager = NetworkManager.shared
        guard let malformedURL = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json") else {
            Issue.record("malformed URL is not in valid URL format")
            return
        }
        await #expect(throws: DecodingError.self) {
            let _ = try await networkManager.fetchEmployees(from: malformedURL)
        }
    }

    @MainActor @Test("Loads empty data")
    func testEmptyDataLoad() async throws {
        let networkManager = NetworkManager.shared
        guard let emptyURL = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json") else {
            Issue.record("empty URL is not in valid URL format")
            return
        }
        await #expect(throws: TidalAPIError.emptyResponse.self) {
            let _ = try await networkManager.fetchEmployees(from: emptyURL)
        }
    }
    
    @MainActor @Test("Loads invalid URL")
    func testInvalidURL() async throws {
        let networkManager = NetworkManager.shared
        guard let invalidURL = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/invalid_url.json") else {
            Issue.record("invalid URL is not in valid URL format, ironically")
            return
        }
        await #expect(throws: TidalAPIError.badResponse.self) {
            let _ = try await networkManager.fetchEmployees(from: invalidURL)
        }
    }

}
