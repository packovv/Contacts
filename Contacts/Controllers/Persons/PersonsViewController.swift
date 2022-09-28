//
//  PersonsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit
import SnapKit

class PersonsViewController: UITableViewController {
    
    private let activityIndicator = ActivityIndicatorView()
    
    private var persons: Persons = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonsViewCell.reuseId, for: indexPath)

        let person = persons[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = person.name
        content.secondaryText = person.email
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension PersonsViewController {
    
    private func fetchPersons() {
        activityIndicator.startActivityIndicator(view)
        APIManager.shared.fetchPersons { [weak self] persons in
            DispatchQueue.main.async {
                self?.persons = persons
                self?.tableView.reloadData()
                self?.activityIndicator.stopActivityIndicator(self!.view)
            }
        }
    }
    
    func setUI() {
        self.tableView.register(PersonsViewCell.self, forCellReuseIdentifier: PersonsViewCell.reuseId)
            fetchPersons()
    }
}
