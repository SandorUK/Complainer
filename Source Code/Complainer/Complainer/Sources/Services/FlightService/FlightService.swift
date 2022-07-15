//
//  FlightService.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import SwiftUI
import SwiftHttp

private struct FlightProviderKey: InjectionKey {
    static var currentValue: FlightProviding = FlightProvider()
}

extension InjectedValues {
    var flight: FlightProviding {
        get { Self[FlightProviderKey.self] }
        set { Self[FlightProviderKey.self] = newValue }
    }
}

protocol FlightProviding {
    func findBy(departureCode: String, date: Date, arrivalCode: String?) async throws -> [Flight]
}

struct FlightProvider: FlightProviding, HttpCodablePipelineCollection {
    
    let client: HttpClient = UrlSessionHttpClient(log: true)
    let apiBaseUrl = HttpUrl(host: "aviation-edge.com", trailingSlashEnabled: false)
    
    func decoder<T>() -> HttpResponseDecoder<T> where T : Decodable {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            let result = DateFormatter.flightApiResponseDate.date(from: dateString)
            return result!
        })
        return .init(decoder: decoder)
    }
    
    func findBy(departureCode: String, date: Date, arrivalCode: String?) async throws -> [Flight] {
        let dateFilter = DateFormatter.flightApiFilterDate.string(from: date)
        
        let url = apiBaseUrl
            .path("v2/public/flightsHistory")
            .query("key", "1ce238-9ef6c5")
            .query("type", "departure")
            .query("date_from", dateFilter)
            .query("date_to", dateFilter)
            .query("code", departureCode)
        
        let result: [Flight] = try await decodableRequest(
            executor: client.dataTask,
            url: url,
            method: .get,
            headers: [
                .key(.accept): "application/json"
            ])
        
        if let arrivalCode = arrivalCode {
            return result.filter { arrivalCode.lowercased() == $0.arrival.iataCode.lowercased() }
        }
        return result
    }
}
