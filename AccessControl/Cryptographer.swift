//
//  Cipher.swift
//  AccessControl
//
//  Created by Shawn Gee on 7/20/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import Foundation
import WrappedWithin

internal class Cryptographer {
    
    // MARK: - Public Properties
    public var key = 3
    
    // MARK: - Private Properties
    
    private let cipher = CaeserCipher()
    
    // MARK: - Public Functions

    func encode(string: String) -> String {
        cipher.shiftCharactersIn(inputString: string, by: key)
    }
    
    func decode(string: String) -> String {
        cipher.shiftCharactersIn(inputString: string, by: -key)
    }
}

fileprivate class CaeserCipher {
    
    private let letters = Array("abcdefghijklmnopqrstuvwxyz")
    
    /// Shifts the characters in a string to the left or right according to the amount passed in,
    /// wrapping the characters within the English alphabet.
    /// - eg: Shifting the string "abc" by an amount of 3 produces the string "def"
    /// - Parameters:
    ///   - inputString: The string in which to shift characters
    ///   - amount: The amount by which to shift each character, positive amounts resulting in a
    ///   right shift, and negative amounts resulting in a left shift
    /// - Returns: A string with all alphabetical characters shifted by the amount passed in,
    /// while all other characters remain unchanged. **Note** that in it's current form, this function does
    /// not retain input case, and the output will be all lowercased letters.
    func shiftCharactersIn(inputString: String, by amount: Int) -> String {
        var outputMap = [Character: Character]()
        for (index, letter) in letters.enumerated() {
            outputMap[letter] = letters[(index + amount).wrappedWithin(count: letters.count)]
        }
        
        let lowercasedString = inputString.lowercased()
        var outputText = ""
        
        for character in lowercasedString {
            if let outputCharacter = outputMap[character] {
                outputText.append(outputCharacter)
            } else {
                outputText.append(character)
            }
        }
        
        return outputText
    }
}
