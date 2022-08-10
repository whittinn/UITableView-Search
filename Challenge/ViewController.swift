//
//  ViewController.swift
//  Challenge
//
//  Created by Nathaniel Whittington on 6/5/22.
//

import UIKit

class ViewController: UIViewController {
   
    

    @IBOutlet weak var customTableView: UITableView!
    var names = [Play(name: "k"),Play(name: "a")]
    var filteredNames = [Play]()
    var vm = ViewModel()
    let searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        customTableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.tintColor = UIColor.white
        searchController.searchBar.barTintColor = UIColor.red
        
        customTableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        vm.getData { user in
            if let user = user {
                print(user.title ?? "")
            }
            
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != ""{
            return filteredNames.count
        }
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let name: Play
        
        guard let cell = customTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        if searchController.isActive && searchController.searchBar.text != ""{
            name = filteredNames[indexPath.row]
        }else{
            name = names[indexPath.row]
        }
        cell.cellText.text = name.name
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterPeople(for: searchController.searchBar.text ?? "")
    }
    
    private func filterPeople(for searchText:String){
        filteredNames = names.filter({ people in
         
            return  people.name!.lowercased().contains(searchText.lowercased())
        })
        customTableView.reloadData()
    }
    
    
    
}

