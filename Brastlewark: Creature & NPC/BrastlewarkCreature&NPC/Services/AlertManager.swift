//
//  AlertManager.swift
//  BrastlewarkCreature&NPC
//
//  Created by  Jose  Santiago on 5/21/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import UIKit

class AlertManager: UIView {
    
    /// Creater a UIAlert with as custom action as a parameter
    ///
    /// - Parameter value: Closure for the "Try Again" button Action

    func showAlertMessage(with action: @escaping () -> Void , viewController: UIViewController) {
        let alert = UIAlertController(title: NSLocalizedString("errorMessage", comment: ""), message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style:   UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Try Again", comment: ""), style:   UIAlertAction.Style.default, handler: { (alert) in
            action()
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
