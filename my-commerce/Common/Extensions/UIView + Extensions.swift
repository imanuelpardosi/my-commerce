//
//  UIView + Extensions.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit

extension UIView {
    
    func showActivityIndicator() {
        if let activityIndicator = self.viewWithTag(123) as? UIActivityIndicatorView {
            activityIndicator.startAnimating()
        } else {
            let activityIndicatorView = UIActivityIndicatorView(style: .medium)
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatorView.tag = 123
            self.addSubview(activityIndicatorView)
            let horizontalConstraint = NSLayoutConstraint(item: activityIndicatorView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: activityIndicatorView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
            self.addConstraint(horizontalConstraint)
            self.addConstraint(verticalConstraint)
            activityIndicatorView.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        self.viewWithTag(123)?.removeFromSuperview()
    }
}
