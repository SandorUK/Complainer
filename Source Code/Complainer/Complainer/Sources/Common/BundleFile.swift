//
//  BundleFile.swift
//  Complainer
//
//  Created by Sandor Kolotenko on 2022. 06. 23..
//

import Foundation

@propertyWrapper struct BundleFile<DataType: Decodable> {
    let name: String
    let type: String = "json"
    let fileManager: FileManager = .default
    let bundle: Bundle = .main
    let decoder = JSONDecoder()

    var wrappedValue: DataType {
        guard let path = bundle.path(forResource: name, ofType: type) else { fatalError("Could not find resource: \(name).\(type)") }
        guard let data = fileManager.contents(atPath: path) else { fatalError("Could not load resource: \(name).\(type)") }
        return try! decoder.decode(DataType.self, from: data)
    }
}
