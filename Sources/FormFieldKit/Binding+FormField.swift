//
//  Binding+FormField.swift
//  FormFieldKit
//
//  Created by Omar Al tawashi on 30/04/2025.
//

import SwiftUI

public extension Binding where Value == FormField<String> {
    var text: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue.value ?? "" },
            set: { self.wrappedValue.value = $0 }
        )
    }

    var errorText: Binding<String> {
        Binding<String>(
            get: { self.wrappedValue.error },
            set: { self.wrappedValue.setError($0) }
        )
    }

    var hasError: Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue.hasError },
            set: { _ in }
        )
    }
}
