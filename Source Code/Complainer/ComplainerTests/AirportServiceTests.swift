//
//  ComplainerTests.swift
//  ComplainerTests
//
//  Created by Sandor Kolotenko on 23/06/2022.
//

import XCTest
@testable import Complainer

class AirportServiceTests: XCTestCase {
    
    var airportService: AirportProviding?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        airportService = AirportProvider()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        airportService = nil
    }

    func testAirportServiceCount() async throws {
        let expectedCount = 3885
        let count = try await airportService?.all().count
        print("Airport Service returned \(String(describing: count)) items")
        XCTAssert(count == expectedCount , "Incorrect number of airports returned.")
    }
    
    func testAirportServiceLookupByCode() async throws {
        let expectedAirportCode = "LHR"
        let airports = try await airportService?.findBy(code: expectedAirportCode)
        print("Airport Service returned \(String(describing: airports))")
        guard let airports = airports else {
            XCTFail("No airport list response was returned. Check if airport service is properly initialised.")
            return
        }
        XCTAssert(airports.count > 0, "No \(expectedAirportCode) airport was found")
    }
    
    func testAirportServiceLookupByName() async throws {
        let airportName = "Ferihegy Airport"
        let expectedAirportCode = "BUD"
        let airports = try await airportService?.findBy(name: airportName)
        guard let airports = airports else {
            XCTFail("No airport list response was returned. Check if airport service is properly initialised.")
            return
        }
        print("Airport Service returned \(airports)")
        XCTAssert(airports.count > 0, "No \(airportName) airport was found")
        let foundAiport = airports.first{ $0.code == expectedAirportCode }
        XCTAssertNotNil(foundAiport, "Could not find \(expectedAirportCode) in service response")
    }
    
    func testAirportServiceLookupByImpossibleCode() async throws {
        let expectedAirportCode = "£$&"
        let airports = try await airportService?.findBy(code: expectedAirportCode)
        print("Airport Service returned \(String(describing: airports))")
        guard let airports = airports else {
            XCTFail("No airport list response was returned. Check if airport service is properly initialised.")
            return
        }
        XCTAssert(airports.count == 0, "An impossible \(expectedAirportCode) airport was found")
    }
    
    func testAirportServiceLookupByImpossibleName() async throws {
        let airportName = "Літовище Будапешту"
        let airports = try await airportService?.findBy(name: airportName)
        guard let airports = airports else {
            XCTFail("No airport list response was returned. Check if airport service is properly initialised.")
            return
        }
        print("Airport Service returned \(airports)")
        XCTAssert(airports.count == 0, "An impossible \(airportName) airport was found")
    }
}
