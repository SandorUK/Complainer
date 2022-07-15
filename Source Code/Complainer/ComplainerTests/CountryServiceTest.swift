//
//  CountryServiceTest.swift
//  ComplainerTests
//
//  Created by Sandor Kolotenko on 24/06/2022.
//

import XCTest
@testable import Complainer

class CountryServiceTest: XCTestCase {

    var countryService: CountryProviding?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        countryService = CountryProvider()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        countryService = nil
    }

    func testCountryServiceCount() async throws {
        let expectedCount = 49
        let count = try await countryService?.all().count
        print("Country Service returned \(String(describing: count)) items")
        XCTAssert(count == expectedCount , "Incorrect number of countries returned.")
    }
    
    func testCountryServiceLookupByCode() async throws {
        let expectedCode = "HU"
        let countries = try await countryService?.findBy(code: expectedCode)
        print("Service returned \(String(describing: countries))")
        guard let countries = countries else {
            XCTFail("No countries list response was returned. Check if countries service is properly initialised.")
            return
        }
        XCTAssert(countries.count > 0, "No \(expectedCode) country was found")
    }
    
    func testAirportServiceLookupByName() async throws {
        let countryName = "Hungary"
        let expectedCode = "HU"
        let countries = try await countryService?.findBy(name: countryName)
        guard let countries = countries else {
            XCTFail("No countries list response was returned. Check if countries service is properly initialised.")
            return
        }
        print("Countries Service returned \(countries)")
        XCTAssert(countries.count > 0, "No \(expectedCode) country was found")
        let foundCountry = countries.first{ $0.code == expectedCode }
        XCTAssertNotNil(foundCountry, "Could not find \(expectedCode) in service response")
    }
    
    func testCountryServiceLookupByImpossibleCode() async throws {
        let expectedCode = "УА"
        let countries = try await countryService?.findBy(code: expectedCode)
        print("Service returned \(String(describing: countries))")
        guard let countries = countries else {
            XCTFail("No countries list response was returned. Check if countries service is properly initialised.")
            return
        }
        XCTAssert(countries.count == 0, "An impossible \(expectedCode) country was found")
    }
    
    func testAirportServiceLookupByImpossibleName() async throws {
        let countryName = "Україна"
        let countries = try await countryService?.findBy(name: countryName)
        guard let countries = countries else {
            XCTFail("No countries list response was returned. Check if countries service is properly initialised.")
            return
        }
        print("Countries Service returned \(countries)")
        XCTAssert(countries.count == 0, "An impossible \(countryName) country was found")
    }
}
