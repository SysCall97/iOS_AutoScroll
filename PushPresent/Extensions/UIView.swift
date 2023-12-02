//
//  UIView.swift
//  PushPresent
//
//  Created by Kazi Mashry on 1/12/23.
//

import UIKit

extension UIView {
    func loadViewFrom(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: nib, bundle: bundle)
        return xib.instantiate(withOwner: self).first as? UIView
    }
}
