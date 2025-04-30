//
//  Validator.swift
//  FormFieldKit
//
//  Created by Omar Al tawashi on 30/04/2025.
//

import Foundation

public struct Validator<T> {
    private let rule: (T?) -> String?

    public init(_ rule: @escaping (T?) -> String?) {
        self.rule = rule
    }

    public func validate(_ value: T?) -> String? {
        rule(value)
    }
}

public extension Validator where T == String {
    static func nonEmpty(_ field: String) -> Validator<String> {
        Validator { value in
            guard let v = value, !v.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                return "\(field) is required"
            }
            return nil
        }
    }

    static func isNumber(_ field: String) -> Validator<String> {
        Validator { value in
            guard let v = value, Int(v) != nil else {
                return "\(field) must be a number"
            }
            return nil
        }
    }

    static func minLength(_ length: Int, field: String) -> Validator<String> {
        Validator { value in
            guard let v = value, v.count >= length else {
                return "\(field) must be at least \(length) characters"
            }
            return nil
        }
    }
}
