//
//  GnomeListPresenter.swift
//  BrastlewarkCreature&NPC
//
//  Created by  Jose  Santiago on 5/22/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

protocol GnomeListDelegate {
    func removeLoadScreen()
    func populateWith(data: [Gnome])
    func showErrorMessage()
}

class GnomeListPresenter {
    
    // MARK: Properties
    
    let networkManager = NetworkManager()
    var delegate: GnomeListDelegate?
    var gnomeData: [Gnome] = []
    var filteredData: [Gnome] = []
    
    // MARK: Methods
    
    func initDelegate(gnomeDelegate: GnomeListDelegate) {
        delegate = gnomeDelegate
        getGnomesData()
    }
    
    func getGnomesData() {
        networkManager.getPopulation { [weak self](response) in
            guard let self = self else { return }
            self.delegate?.removeLoadScreen()
            if let gnomes = response {
                self.gnomeData = self.sortGnomes(gnomes)
                self.delegate?.populateWith(data: self.gnomeData)
            } else {
                self.delegate?.showErrorMessage()
            }
        }
    }
    
    internal func sortGnomes(_ gnomes: [Gnome]) -> [Gnome] {
        let sortedGnomes = gnomes.sorted(by: { (leftGnome, rightGnome) -> Bool in
              return leftGnome.name?.lowercased() ?? "a" < rightGnome.name?.lowercased() ?? "z"
          })
        return sortedGnomes
    }
    
    func filterData(_ string: String) {
        if !string.isEmpty {
            filteredData = gnomeData.filter({ (gnome: Gnome) -> Bool in
                return (gnome.name?.lowercased().contains(string.lowercased())) ?? false
            })
        } else {
            filteredData = gnomeData
        }
        delegate?.populateWith(data: filteredData)
    }
}
