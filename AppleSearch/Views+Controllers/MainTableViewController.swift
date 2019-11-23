//
//  MainTableViewController.swift
//  AppleSearch
//
//  Created by Chris Anderson on 11/21/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {

    var appStoreItems: [AppStoreItem] = []
    
    @IBOutlet weak var songLabel: UILabel!
    
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var itemSearchBar: UISearchBar!
    @IBOutlet weak var itemSegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemSearchBar.delegate = self
        itemSearchBar.layer.backgroundColor = UIColor.cyan.cgColor;
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchText = itemSearchBar.text, !searchText.isEmpty else { return }
        
        let itemType: AppStoreItem.ItemType = (itemSegmentedControl.selectedSegmentIndex == 0) ? .song : .movie
        
        AppStoreItemController.getItemsOf(type: itemType, searchText: searchText) { (items) in
            self.appStoreItems = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.itemSearchBar.text = ""
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appStoreItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppStoreItemCell", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }

        let appStoreItem = appStoreItems[indexPath.row]
        cell.item = appStoreItem
        return cell
    }
}
