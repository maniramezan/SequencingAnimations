//
//  UIView+Helper.swift
//  SequencingAnimations
//
//  Created by Mani Ramezan on 2/28/18.
//  Copyright © 2018 Mani Ramezan. All rights reserved.
//

import UIKit

extension UIView {
    func setTransform(rotationInDegrees: CGFloat) {
        let radians = rotationInDegrees / 180.0 * CGFloat.pi
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}
