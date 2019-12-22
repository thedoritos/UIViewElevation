//
//  CardView.swift
//  UIViewElevation
//
//  Created by thedoritos on 2019/12/22.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import UIKit

class CardView: UIView {
    private weak var ambientShadowLayer: CALayer?

    let maxElevation: CGFloat = 16

    func setShadowElevation(_ elevation: CGFloat) {
        let cornerRadius: CGFloat = 4
        self.layer.cornerRadius = cornerRadius

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = elevation
        self.layer.shadowOffset = CGSize(width: 0, height: elevation)
        self.layer.shadowOpacity = 0.33

        let ambientShadowLayer = self.ambientShadowLayer ?? { (view: UIView) -> CALayer in
            let superLayer = view.layer

            let layer = CAShapeLayer()
            layer.bounds = superLayer.bounds
            layer.anchorPoint = .zero

            let path = UIBezierPath(roundedRect: superLayer.bounds, cornerRadius: superLayer.cornerRadius)
            layer.path = path.cgPath
            layer.fillColor = view.backgroundColor?.cgColor

            let maskPath = UIBezierPath(rect: superLayer.bounds.insetBy(dx: -maxElevation * 2, dy: -maxElevation * 4))
            maskPath.append(path)

            let mask = CAShapeLayer()
            mask.path = maskPath.cgPath
            mask.bounds = superLayer.bounds
            mask.anchorPoint = .zero
            mask.fillRule = .evenOdd
            mask.fillColor = view.backgroundColor?.cgColor
            layer.mask = mask

            view.layer.addSublayer(layer)
            return layer
        }(self)
        self.ambientShadowLayer = ambientShadowLayer

        ambientShadowLayer.shadowColor = UIColor.black.cgColor
        ambientShadowLayer.shadowRadius = elevation
        ambientShadowLayer.shadowOffset = .zero
        ambientShadowLayer.shadowOpacity = 0.11
    }
}
