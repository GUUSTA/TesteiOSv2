//
//  Extensions.swift
//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

extension UIButton {
    func cornerRadius(to: CGFloat) {
        self.layer.cornerRadius = to
    }
}

extension String {
    func isValidPassword() -> Bool{
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: self)
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: self)
        
        let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = texttest2.evaluate(with: self)

        return capitalresult && numberresult && specialresult
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
     func isValidCPF() -> Bool {
        let numbers = compactMap({ $0.wholeNumberValue })
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        func digitCalculator(_ slice: ArraySlice<Int>) -> Int {
            var number = slice.count + 2
            let digit = 11 - slice.reduce(into: 0) {
                number -= 1
                $0 += $1 * number
            } % 11
            return digit % 10
        }
        let dv1 = digitCalculator(numbers.prefix(9))
        let dv2 = digitCalculator(numbers.prefix(10))
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
    func substring(_ r: Range<Int>) -> String {
         let fromIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
         let toIndex = self.index(self.startIndex, offsetBy: r.upperBound)
         let indexRange = Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex))
         return String(self[indexRange])
     }

    
}
