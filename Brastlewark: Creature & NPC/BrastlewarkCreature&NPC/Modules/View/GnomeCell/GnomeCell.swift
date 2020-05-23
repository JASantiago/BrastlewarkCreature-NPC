//
//  GnomeCell.swift
//  BrastlewarkCreature&NPC
//
//  Created by  Jose  Santiago on 5/20/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import UIKit

class GnomeCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var profesionsLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    // MARK: Properties
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        let bundle = Bundle(for: self)
        return UINib(nibName: identifier, bundle: bundle)
    }
    
    var model: Gnome? {
        didSet {
            guard let model = self.model else { return }
            nameLabel.text = model.name
            weightLabel.text = "\(Int(model.weight!))"
            heightLabel.text = "\(Int(model.height!))"
            hairColor.text = model.hair_color
            profesionsLabel.text =  arrayToString(model.professions!)
            ageLabel.text = "\(model.age!)"
            if !(model.friends?.isEmpty ?? false) {
                friendsLabel.text = "\(NSLocalizedString("Friends", comment: "")): \(arrayToString(model.friends!))"
            }
        }
        
    }
    
    // MARK: Methods
    
    private func configureUI() {
        avatarImageView.roundCorners()
        cellContainerView.roundCorners()
    }
    
    private func arrayToString(_ stringArr: [String]) -> String {
        if stringArr.isEmpty { return "" }
        var stringValue = stringArr.first!
        
        var i = 1
        while i < stringArr.count {
            stringValue = "\(stringValue), \(stringArr[i])"
            i += 1
        }
        return stringValue
    }
    
    // MARK: LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    override func prepareForReuse() {
        avatarImageView.image = UIImage(named: Constants.defaultAvatarImage)
    }

}
