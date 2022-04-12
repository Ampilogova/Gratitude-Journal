//
//  HistoryViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/14/22.
//

import UIKit
import Firebase

class GratitudeJournalTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchControllerDelegate {

     private var gratitudeService = GratitudeService()
     private var tableView = UITableView()
     private var viewModel = UserData(data: [:])
     private var searchController = UISearchController()
     private var allGratitudes = [GratitudeModel]()
     private var gratitudes = [GratitudeModel]()

     override func viewDidLoad() {
          super.viewDidLoad()
          self.view.backgroundColor = .customBackgroundColor
          setupTableView()
          createSearchBar()
          setupNavigationBar()
     }
     
     override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
          loadData()
     }
     
     private func loadData() {
          gratitudeService.loadGratitudes { result in
               DispatchQueue.main.async {
                    self.gratitudes = result
                    self.allGratitudes = result
                    self.tableView.reloadData()
               }
          }
     }
     
     private func setupTableView() {
          tableView = UITableView(frame: view.frame, style: .plain)
          tableView.separatorStyle = .none
          tableView.register(GratitudeCell.self, forCellReuseIdentifier: GratitudeCell.className)
          tableView.delegate = self
          tableView.dataSource = self
          tableView.backgroundColor = .customBackgroundColor
          
          tableView.translatesAutoresizingMaskIntoConstraints = false
          self.view.addSubview(tableView)
          NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          ])
     }
     
     private func setupNavigationBar() {
          self.title = loc("gratefuli")
          navigationController?.navigationBar.prefersLargeTitles = true
          navigationItem.largeTitleDisplayMode = .automatic
          let appearance = UINavigationBarAppearance()
          appearance.backgroundColor = .customBackgroundColor
          appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
          appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
          navigationController?.navigationBar.prefersLargeTitles = true
          navigationController?.navigationBar.barTintColor = .customLabelColor
          navigationController?.navigationBar.standardAppearance = appearance
          navigationController?.navigationBar.compactAppearance = appearance
          navigationController?.navigationBar.scrollEdgeAppearance = appearance

          let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
          add.tintColor = .customYellowColor
          navigationItem.rightBarButtonItems = [add]
     }
     
     private func createSearchBar() {
          searchController.title = loc("Search.notes")
          searchController.searchResultsUpdater = self
          searchController.searchBar.tintColor = .customLabelColor
          searchController.searchBar.searchTextField.backgroundColor = .white
          searchController.delegate = self
          
          self.navigationItem.searchController = searchController
          searchController.searchResultsUpdater = self
          definesPresentationContext = true
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return gratitudes.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: GratitudeCell.className, for: indexPath) as! GratitudeCell
          let filtered = gratitudes.sorted(by: { $0.key ?? "" > $1.key ?? "" })
          cell.configure(with: filtered[indexPath.row])

          return cell
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let filtered = gratitudes.sorted(by: { $0.key ?? "" > $1.key ?? "" })
          let gratitudeSelected = filtered[indexPath.row]
          let vc = EditGratitudeViewController(text: gratitudeSelected.gratitude ?? "", date: gratitudeSelected.date ?? "", key: gratitudeSelected.key ?? "")
          self.navigationController?.pushViewController(vc, animated: true)
     }
     
     func updateSearchResults(for searchController: UISearchController) {
          searchController.showsSearchResultsController = true
          filterGratitude(searchText: searchController.searchBar.text ?? "")
     }
     
     func tableView(_ tableView: UITableView,
                    editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
          return .none
     }
     
     private func filterGratitude(searchText: String) {
          if searchText.count > 0 {
               gratitudes = allGratitudes.filter({ $0.gratitude?.contains(searchText) == true })
          } else {
               gratitudes = allGratitudes
          }
          tableView.reloadData()
     }
     @objc private func addTapped() {
          let vc = CreateNoteViewController()
          self.navigationController?.pushViewController(vc, animated: true)
     }
}

