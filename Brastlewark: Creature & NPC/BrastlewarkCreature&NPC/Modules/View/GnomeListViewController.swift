//
//  ViewController.swift
//  Brastlewark: Creature & NPC
//
//  Created by  Jose  Santiago on 5/20/20.
//  Copyright © 2020  Jose  Santiago. All rights reserved.
//

import UIKit

class GnomeListViewController: UIViewController {
    
    // MARK: Properties
    
    private var gnomesList: [Gnome] = []
    private var selectedIndex: Int?
    private var presenter = GnomeListPresenter()
    private var alertManager = AlertManager()
    private var loaded = false {
        didSet {
            loadingView.isHidden = self.loaded
        }
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    // MARK: Methods
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GnomeCell.nib, forCellReuseIdentifier: GnomeCell.identifier)
        
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        searchBar.delegate = self
        presenter.initDelegate(gnomeDelegate: self)
    }

}

// MARK: GnomeListDelegate

extension GnomeListViewController: GnomeListDelegate {
    func showErrorMessage() {
        alertManager.showAlertMessage(with: {
            self.presenter.getGnomesData()
        }, viewController: self)
    }
    
    func removeLoadScreen() {
        loaded = true
    }
    
    func populateWith(data: [Gnome]) {
        self.gnomesList = data
        self.tableView.reloadData()
    }
    
}

// MARK: TableViewDelegate

extension GnomeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnomesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: GnomeCell.identifier, for: indexPath) as? GnomeCell else { return UITableViewCell() }
        customCell.model = gnomesList[indexPath.row]
        UIImageView().getImageFromCache(urlString: gnomesList[indexPath.row].thumbnail!) { (image: UIImage!) in
            customCell.avatarImageView.image = image
        }
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == selectedIndex {
            selectedIndex = nil
        } else {
            selectedIndex = indexPath.row
        }
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return CGFloat(Constants.biggerCellHeignt)
        } else {
            return CGFloat(Constants.normalCellHeight)
        }
    }
}

// MARK: UISearchBarDelegate

extension GnomeListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.filterData(searchText)
    }
}
