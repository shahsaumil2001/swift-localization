//
//  UIView+Extension.swift
//  Swift-Localization
//
//  Created by Saumil Shah on 26/11/24.
//

import UIKit

extension UIView {
    ///
    /// The extension is `cornerRadius` which is used to add corner radius to View
    /// A View extension's `cornerRadius` method
    ///
    func cornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
