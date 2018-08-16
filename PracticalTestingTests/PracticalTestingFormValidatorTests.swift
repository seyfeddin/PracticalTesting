//
//  PracticalTestingFormValidatorTests.swift
//  PracticalTestingTests
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import Quick
import Nimble

@testable import PracticalTesting

class PracticalTestingFormValidatorTests: QuickSpec {
    
    override func spec() {
        describe("validator") {

            it("should validate a valid email", closure: {
                let result = FormValidator.validate(string: "abc@gmail.com", withType: .email)

                expect(result).to(equal(true))
            })

            it("should not validate an invalid email", closure: {
                var result = FormValidator.validate(string: "@gmail.com", withType: .email)

                expect(result).to(equal(false))

                result = FormValidator.validate(string: "@gmail.com", withType: .email)
                expect(result).to(equal(false))

                result = FormValidator.validate(string: "gmail.com", withType: .email)
                expect(result).to(equal(false))

                result = FormValidator.validate(string: "   ", withType: .email)
                expect(result).to(equal(false))

                result = FormValidator.validate(string: "asd", withType: .email)
                expect(result).to(equal(false))

            })
        }
    }
    
}
