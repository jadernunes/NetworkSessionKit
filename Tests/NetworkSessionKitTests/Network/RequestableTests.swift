//
//  RequestableTests.swift
//  
//
//  Created by Jader Nunes on 11/07/24.
//

import XCTest
@testable import NetworkSessionKit

final class RequestableTests: XCTestCase {
    
    func testAsURLRequestGetMethod() throws {
        let mockRequest = MockRequest(
            path: "endpoint",
            method: .get,
            parameters: ["key": "value"],
            headers: ["Authorization": "Bearer token"])
        
        let urlRequest = try mockRequest.asURLRequest()
        
        XCTAssertEqual(urlRequest.url?.absoluteString, "TEST/endpoint?key=value")
        XCTAssertEqual(urlRequest.httpMethod, "GET")
        XCTAssertEqual(urlRequest.headers["Authorization"], "Bearer token")
    }
    
    func testAsURLRequestPostMethod() throws {
        let mockRequest = MockRequest(
            path: "endpoint",
            method: .post,
            parameters: ["key": "value"],
            headers: ["Authorization": "Bearer token"])
        
        let urlRequest = try mockRequest.asURLRequest()
        
        XCTAssertEqual(urlRequest.url?.absoluteString, "TEST/endpoint")
        XCTAssertEqual(urlRequest.httpMethod, "POST")
        XCTAssertEqual(urlRequest.allHTTPHeaderFields?["Authorization"], "Bearer token")
        XCTAssertNotNil(urlRequest.httpBody)
        
        if let httpBody = urlRequest.httpBody {
            let json = try JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: Any]
            XCTAssertEqual(json?["key"] as? String, "value")
        }
    }
}

// MARK: - Helper

private struct MockRequest: Requestable {
    var path: String
    var method: HTTPMethodType
    var parameters: Params?
    var headers: Headers
}
