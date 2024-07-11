//
//  JSONDecoder+ExtensionTests.swift
//
//
//  Created by Jader Nunes on 11/07/24.
//

import XCTest
@testable import NetworkSessionKit

final class JSONDecoderExtensionTests: XCTestCase {
    
    func testCustomDecoder() {
        // Define a date string matching the expected format
        let dateString = "2024-07-10"
        
        // Create JSON data including the date
        let jsonString = """
        {
            "name": "John Doe",
            "date": "\(dateString)"
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        
        // Decode the JSON data
        do {
            let decoder = JSONDecoder.decoder
            let testObject = try decoder.decode(TestDecodable.self, from: jsonData)
            
            // Define the expected date formatter
            let formatter = DateFormatter.dateFormatterReceived
            let expectedDate = formatter.date(from: dateString)
            
            // Assertions
            XCTAssertEqual(testObject.name, "John Doe")
            XCTAssertEqual(testObject.date, expectedDate)
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
    
    func testInvalidDateFormat() {
        // Define a date string not matching the expected format
        let dateString = "10-07-2024"
        
        // Create JSON data including the invalid date
        let jsonString = """
        {
            "name": "John Doe",
            "date": "\(dateString)"
        }
        """
        let jsonData = jsonString.data(using: .utf8)!
        
        // Attempt to decode the JSON data
        do {
            let decoder = JSONDecoder.decoder
            _ = try decoder.decode(TestDecodable.self, from: jsonData)
            XCTFail("Decoding should have failed due to incorrect date format")
        } catch {
            // Ensure the decoding fails
            XCTAssert(true)
        }
    }
}

// MARK: - Helper

private struct TestDecodable: Decodable {
    let name: String
    let date: Date
}
