//
//  FormFieldTests.swift
//  FormFieldKit
//
//  Created by Omar Al tawashi on 30/04/2025.
//

import XCTest
@testable import FormFieldKit

final class FormFieldTests: XCTestCase {
    func testNonEmptyValidatorFails() {
        let field = FormField<String>(
            value: "",
            validators: [.nonEmpty("Name")]
        )
        XCTAssertFalse(field.validate())
        XCTAssertEqual(field.error, "Name is required")
    }

    func testValidInputPasses() {
        let field = FormField<String>(
            value: "John",
            validators: [.nonEmpty("Name")]
        )
        XCTAssertTrue(field.validate())
        XCTAssertEqual(field.error, "")
    }
}
