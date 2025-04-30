//
//  FormFieldValidation.swift
//  FormFieldKit
//
//  Created by Omar Al tawashi on 30/04/2025.
//

import Foundation

public func validateFields(_ fields: [FormField<String>]) -> Bool {
    var isValid = true
    for field in fields {
        let result = field.validate()
        isValid = result && isValid
    }
    return isValid
}
