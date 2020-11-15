//
//  ReactorkitPracticeTests.swift
//  ReactorkitPracticeTests
//
//  Created by Lyine on 2020/11/15.
//

import XCTest
@testable import ReactorkitPractice

class ReactorkitPracticeTests: XCTestCase {
	
	var service: ButtonAPI?
	var reactor: ButtonReactor?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		
		// given
		
		self.service = ButtonAPI()
		if let service = service {
			self.reactor = ButtonReactor(service: service)
			print("success: \(reactor?.currentState)")
		}
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
		// when
		
		reactor?.action.onNext(.push)
		
		// then
		
		XCTAssertEqual(reactor?.currentState.isPushed, true)
		XCTAssertNotEqual(reactor?.currentState.message.isEmpty, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
