//
//  NetworkErrorTypeTests.swift
//
//
//  Created by Jader Nunes on 11/07/24.
//

import XCTest
@testable import NetworkSessionKit

final class NetworkErrorTypeTests: XCTestCase {
    
    func testMissingURL() {
        let errorType: NetworkErrorType = .missingURL
        XCTAssertEqual(errorType.message, "The operation couldn’t be completed. (NetworkSessionKit.NetworkErrorType error 1.)")
    }
    
    func testJsonEncodingFailed() {
        let encodingError = NSError(domain: "Test", code: 1, userInfo: [NSLocalizedDescriptionKey: "Encoding failed"])
        let errorType: NetworkErrorType = .jsonEncodingFailed(error: encodingError)
        XCTAssertEqual(errorType.message, "Encoding failed")
    }
    
    func testNoInternet() {
        let errorType: NetworkErrorType = .noInternet
        XCTAssertEqual(errorType.message, NetworkSessionStrings.noInternetError.localized())
    }
    
    func testGeneric() {
        let errorType: NetworkErrorType = .generic
        XCTAssertEqual(errorType.message, NetworkSessionStrings.genericError.localized())
    }
}
