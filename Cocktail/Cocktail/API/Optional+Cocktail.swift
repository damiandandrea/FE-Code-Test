//
//  Optional+Cocktail.swift
//

import Foundation

extension Optional {
    func required(_ name: String = "<unknown>") throws -> Wrapped {
        guard let value = self else {
            throw MissingRequiredValue(name: name, type: Wrapped.self)
        }
        return value
    }
}

struct MissingRequiredValue: Error {
    let name: String?
    let type: Any.Type
}
