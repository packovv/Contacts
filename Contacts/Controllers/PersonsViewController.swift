//
//  PersonsViewController.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import UIKit

// Стоит написать final class
class PersonsViewController: UITableViewController {

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    private var thisUsers: Users = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }

    // Можно не писать return
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thisUsers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personsCell", for: indexPath)

        let user = thisUsers[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = user.name
        content.secondaryText = user.email
        cell.contentConfiguration = content
        
        return cell
    }

    // Можно не писать return
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
    
    private func getUsers() {
        startActivityIndicator()
        APIManager.shared.getUsers { [weak self] users in
            DispatchQueue.main.async {
                self?.thisUsers = users
                self?.tableView.reloadData()
                self?.stopActivityIndicator()
            }
        }
    }
}
