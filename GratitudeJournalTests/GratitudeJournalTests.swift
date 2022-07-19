//
//  GratitudeJournalTests.swift
//  GratitudeJournalTests
//
//  Created by Tatiana Ampilogova on 6/27/22.
//

import XCTest
@testable import Gratitude_Journal

class GratitudeJournalTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewRounding() throws {
        let view = UIView()
        view.makeRounded()
        
        XCTAssertEqual(view.layer.cornerRadius, 30)
    }
    
    func testGratitudeService() throws {
        let service = GratitudeService()
        let date = Date(timeIntervalSince1970: 0)
        
        let key = service.createKey(date: date)
        XCTAssertEqual(key, "Wed, 31 Dec 1969 16:00:00 -0800")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
