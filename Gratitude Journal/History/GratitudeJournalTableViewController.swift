//
//  HistoryViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/14/22.
//

import UIKit
import Firebase

class GratitudeJournalTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    private var gratitudeService = GratitudeService()
    private var tableView = UITableView()
    private var viewModel = UserData(data: [:])
    private var searchController = UISearchController()
    private var result = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .customBackgroundColor
        setupNavigationBar()
        createSearchBar()
        setupTableView()
    }
    
    private func loadData() {
        gratitudeService.loadData { result in
            self.viewModel = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .plain)
        tableView.separatorStyle = .none
        tableView.register(GratitudeCell.self, forCellReuseIdentifier: GratitudeCell.className)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .customBackgroundColor
        tableView.pinToSuperview()
        self.view.addSubview(tableView)
    }
    
    private func setupNavigationBar() {
        self.title = "Gratitfuli"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .customBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .customLabelColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func createSearchBar() {
        searchController.title = "Search by notes"
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = .customLabelColor
        searchController.searchBar.searchTextField.backgroundColor = .white
        self.navigationItem.searchController = searchController
        
        searchController.searchResultsUpdater = self
//        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return result.count
        }
        return viewModel.data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GratitudeCell.className, for: indexPath) as! GratitudeCell
        let keyArray = Array(viewModel.data.keys).sorted(by: { $0 > $1 })
        let currentKey = keyArray[indexPath.row]
        let gratitudeModel: GratitudeModel
        
        if searchController.isActive && searchController.searchBar.text != "" {
//            gratitudeModel = result[indexPath.row]
        } else {
            if let dict = self.viewModel.data[currentKey] as? [String: Any],
               let model = GratitudeModel.from(dict) {
                cell.configure(with: model)
            }
            
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
        filterGratitude(for: searchController.searchBar.text ?? "")
    }
    
    
    private func filterGratitude(for searchText: String) {
        result = viewModel.data.filter { (key, value) in
            let model = GratitudeModel.from(result)
            return ((model?.gratitude?.lowercased().contains(searchText.lowercased())) != nil)
        }
        tableView.reloadData()
    }
}

