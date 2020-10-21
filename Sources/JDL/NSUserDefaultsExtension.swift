//
//  NSUserDefaultsExtension.swift
//
//  Created by Christian Cabarrocas on 21/10/2019.
//

import Foundation

public extension UserDefaults {

    class func save<T>(_ object: T, forKey key: String) throws where T: Codable {
        if let data = try? JSONEncoder().encode(object) {
            UserDefaults.standard.set(data, forKey: key)
        } else {
            throw JDLError.saveDefaults
        }
    }

    class func load<T>(_ key: String) throws -> T! where T: Codable {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        if let object = try? JSONDecoder().decode(T.self, from: data) {
            return object
        } else {
            throw JDLError.loadDefaults
        }
    }

    class func remove(forKey key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
