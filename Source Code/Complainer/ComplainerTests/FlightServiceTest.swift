//
//  FlightServiceTest.swift
//  ComplainerTests
//
//  Created by Sandor Kolotenko on 24/06/2022.
//

import XCTest
@testable import Complainer

class FlightServiceTest: XCTestCase {

    var service: FlightProviding?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = MockFlightProvider()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        service = nil
    }

    func testFlight_OK() async throws {
        let expectedCode = "qs5098"
        let fligths = try await service?.findBy(departureCode: "BUD", date: Date(), arrivalCode: "LHR")
        print("Service returned \(String(describing: fligths))")
        guard let fligths = fligths else {
            XCTFail("No fligths list response was returned. Check if fligths service is properly initialised.")
            return
        }
        XCTAssert(fligths.count > 0, "No fligths was found")
        let fligth = fligths.first { $0.flight.iataNumber == expectedCode }
        XCTAssertNotNil(fligth, "No \(expectedCode) flight was found.")
    }
    
    func testFlight_WRONG_CODE() async throws {
        let expectedCode = "BA0985"
        let fligths = try await service?.findBy(departureCode: "@@@", date: Date(), arrivalCode: "!!!")
        print("Service returned \(String(describing: fligths))")
        guard let fligths = fligths else {
            XCTFail("No fligths list response was returned. Check if fligths service is properly initialised.")
            return
        }
        let fligth = fligths.first { $0.flight.iataNumber == expectedCode }
        XCTAssertNil(fligth, "\(expectedCode) flight was found, but none was expected")
    }
}
