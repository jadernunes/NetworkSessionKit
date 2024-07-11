//
//  DateFormatter+ExtensionTests.swift
//
//
//  Created by Jader Nunes on 11/07/24.
//

import XCTest
@testable import NetworkSessionKit

final class DateFormatterExtensionTests: XCTestCase {
    
    func testDateFormatterReceived() {
        let dateFormatter = DateFormatter.dateFormatterReceived
        let expectedDateFormat = DateFormatType.serverShort.rawValue
        
        XCTAssertEqual(dateFormatter.dateFormat, expectedDateFormat, "The date format should be \(expectedDateFormat)")
    }
}
