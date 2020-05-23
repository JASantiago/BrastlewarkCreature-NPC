//
//  UIView.swift
//  BrastlewarkCreature&NPC
//
//  Created by  Jose  Santiago on 5/21/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners() {
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
    }
}
