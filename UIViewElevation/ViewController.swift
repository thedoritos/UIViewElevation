//
//  ViewController.swift
//  UIViewElevation
//
//  Created by thedoritos on 2019/12/22.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {
    @IBOutlet weak var mdcCard: MDCCard!
    @IBOutlet weak var cardView: CardView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.elevation = 0.0
    }

    var elevation: Float = 0.0 {
        didSet {
            let mdcElevation = ShadowElevation(CGFloat(self.elevation))
            self.mdcCard.setShadowElevation(mdcElevation, for: .normal)
            self.cardView.setShadowElevation(self.elevation)
        }
    }

    @IBAction func elevationSwitchValueChanged(_ sender: UISegmentedControl) {
        guard
            let title = sender.titleForSegment(at: sender.selectedSegmentIndex),
            let elevation = Float(title) else { return }

        self.elevation = elevation
    }
}
