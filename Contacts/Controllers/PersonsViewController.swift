//
//  PersonsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

class PersonsViewController: UITableViewController {

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    private var persons: Persons = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPersons()
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
    
    private func setupActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }
    
    private func startActivityIndicator() {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    private func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    private func fetchPersons() {
        startActivityIndicator()
        APIManager.shared.getUsers { [weak self] persons in
            DispatchQueue.main.async {
                self?.persons = persons
                self?.tableView.reloadData()
                self?.stopActivityIndicator()
            }
        }
    }
}
