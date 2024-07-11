//
//  Encodable+ExtensionTests.swift
//
//
//  Created by Jader Nunes on 11/07/24.
//

import XCTest
@testable import NetworkSessionKit

final class EncodableExtensionTests: XCTestCase {
    
    func testToJsonSimpleStruct() {
        let testStruct = TestStruct(name: "John", age: 30)
        let json = testStruct.toJson()
        
        XCTAssertEqual(json["name"] as? String, "John")
        XCTAssertEqual(json["age"] as? Int, 30)
    }
    
    func testToJsonNestedStruct() {
        let nestedStruct = TestNestedStruct(title: "Developer", details: TestStruct(name: "John", age: 30))
        let json = nestedStruct.toJson()
        
        XCTAssertEqual(json["title"] as? String, "Developer")
        
        if let details = json["details"] as? [String: Any] {
            XCTAssertEqual(details["name"] as? String, "John")
            XCTAssertEqual(details["age"] as? Int, 30)
        } else {
            XCTFail("Details should be a dictionary")
        }
    }
    
    func testToJsonOptionalStruct() {
        let optionalStruct = TestOptionalStruct(name: "John", nickname: nil)
        let json = optionalStruct.toJson()
        
        XCTAssertEqual(json["name"] as? String, "John")
        XCTAssertNil(json["nickname"])
    }
    
    func testToJsonWithInvalidData() {
        struct InvalidData: Encodable {
            let data: Data
        }
        
        let invalidStruct = [InvalidData(data: Data())]
        let json = invalidStruct.toJson()
        
        XCTAssertTrue(json.isEmpty)
    }
    
    func testToJsonThrowsError() {
        let throwingEncodable = ThrowingEncodable()
        let json = throwingEncodable.toJson()
        
        XCTAssertTrue(json.isEmpty, "The json dictionary should be empty when encoding fails.")
    }
}

// MARK: - Helper

private struct ThrowingEncodable: Encodable {
    func encode(to encoder: Encoder) throws {
        throw NSError(domain: "TestDomain", code: -1, userInfo: nil)
    }
}

private struct TestStruct: Encodable {
    let name: String
    let age: Int
}

private struct TestNestedStruct: Encodable {
    let title: String
    let details: TestStruct
}

private struct TestOptionalStruct: Encodable {
    let name: String
    let nickname: String?
}
