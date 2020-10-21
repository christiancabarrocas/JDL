//
//  JDLError.swift
//  
//  Created by Christian Cabarrocas on 21/10/2019.
//

import Foundation

public enum JDLError: Error {
    case saveDefaults
    case loadDefaults
    case jsonNotFound
    case jsonLoad
    case jsonParse
}
