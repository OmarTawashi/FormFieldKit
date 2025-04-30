//
//  FormField.swift
//  FormFieldKit
//
//  Created by Omar Al tawashi on 30/04/2025.
//

import Foundation
import Combine

public final class FormField<T>: ObservableObject {
    @Published public var value: T?
    public let title: String?
    public let placeholder: String?

    @Published private(set) public var error: String = ""
    public var hasError: Bool { !error.isEmpty }

    public var validators: [Validator<T>] = []

    public init(
        value: T? = nil,
        title: String? = nil,
        placeholder: String? = nil,
        validators: [Validator<T>] = []
    ) {
        self.value = value
        self.title = title
        self.placeholder = placeholder
        self.validators = validators
    }

    @discardableResult
    public func validate() -> Bool {
        for validator in validators {
            if let message = validator.validate(value) {
                self.error = message
                return false
            }
        }
        self.error = ""
        return true
    }

    public func setError(_ message: String) {
        self.error = message
    }
}
