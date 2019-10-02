//
//  Extensions.swift
//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 01/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

import UIKit

extension UITextField {
    func borderStyle(type: UITextField.BorderStyle) {
        self.borderStyle = type
    }
}

extension UIButton {
    func cornerRadius(to: CGFloat) {
        self.layer.cornerRadius = to
    }
}
