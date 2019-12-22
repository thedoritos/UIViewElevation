//
//  CardView.swift
//  UIViewElevation
//
//  Created by thedoritos on 2019/12/22.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import UIKit

class CardView: UIView {
    func setShadowElevation(_ elevation: CGFloat) {
        let cornerRadius: CGFloat = 4
        self.layer.cornerRadius = cornerRadius

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = elevation
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.33
    }
}
