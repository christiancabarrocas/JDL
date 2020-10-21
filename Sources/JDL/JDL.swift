//
//  JDL.swift
//
//  Created by Christian Cabarrocas on 21/10/2019.
//

import Foundation

final class JDL {

    func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) throws -> T {

        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            throw JDLError.jsonNotFound
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            throw JDLError.jsonLoad
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw JDLError.jsonParse
        }
    }
}
