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
     private var result = [[String]]()
     
     override func viewDidLoad() {
          super.viewDidLoad()
          self.view.backgroundColor = .customBackgroundColor
          searchController.delegate = self
          setupNavigationBar()
          setupTableView()
          createSearchBar()
          loadData()
     }
     
     private func loadData() {
          gratitudeService.loadData { result in
               self.viewModel = result
               DispatchQueue.main.async {
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
          tableView.pinToSuperview()
          self.view.addSubview(tableView)
     }
     
     private func setupNavigationBar() {
          self.title = loc("gratefuli")
          
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
          searchController.title = loc("Search.notes")
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
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
     }
     
     func updateSearchResults(for searchController: UISearchController) {
          searchController.showsSearchResultsController = true
          filterGratitude(searchText: searchController.searchBar.text ?? "")
     }
     
     func tableView(_ tableView: UITableView,
                    editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
          return .none
     }
     
     func tableView(_ tableView: UITableView,
                    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
          let keyArray = Array((self.viewModel.data.keys)).sorted(by: { $0 > $1 })
          let currentKey = keyArray[indexPath.row]
          
          let delete = UIContextualAction(style: .destructive,
                                          title: loc("delete")) { [weak self] (action, view, completionHandler) in
               self?.viewModel.data.removeValue(forKey: currentKey)
               tableView.deleteRows(at: [indexPath], with: .fade)
               self?.gratitudeService.removeData(key: currentKey)
               completionHandler(true)
          }
          delete.backgroundColor = .systemRed
          
          let edit = UIContextualAction(style: .normal,
                                        title: loc("edit")) { [weak self] (action, view, completionHandler) in
               if let dict = self?.viewModel.data[currentKey] as? [String: Any],
                  let model = GratitudeModel.from(dict) {
                    let vc = CreateNoteViewController(text: model.gratitude ?? "")
                    self?.navigationController?.pushViewController(vc, animated: true)
               }
               completionHandler(true)
          }
          edit.backgroundColor = .customYellowColor
          
          return UISwipeActionsConfiguration(actions: [delete, edit])
     }
     
     private func filterGratitude(searchText: String) {
          let value = Array(viewModel.data.values)
          
          tableView.reloadData()
     }
}

