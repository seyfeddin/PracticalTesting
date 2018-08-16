//
//  FormValidator.swift
//  PracticalTesting
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import Foundation

struct FormValidator {
    enum ValidationType {
        case email
        case password
    }

    static func validate(string: String, withType type: ValidationType) -> Bool {
        switch type {
        case .email:
            return validateEmail(string: string)
        case .password:
            return validatePassword(string: string)
        }
    }

    static private func validateEmail(string: String) -> Bool {
        let emailRegex =
        "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"

        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)

        return emailTest.evaluate(with: string)
    }

    static private func validatePassword(string: String) -> Bool {
        let range = string.rangeOfCharacter(from: .whitespacesAndNewlines)

        // returns false when there's no range for whitespace
        if let _ = range {
            return false
        }

        if (string.count >= 4 && string.count <= 12) {
            return true
        } else {
            return false
        }
    }
}
