//
//  TabBarController.swift
//  Contacts
//
//  Created by packovv on 13.08.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavigaionController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navigationController
    }

    func setupVCs() {
        viewControllers = [
            createNavigaionController(for: ContactsViewController(), title: NSLocalizedString("Contacts", comment: ""), image: UIImage(systemName: "magazine.fill")!),
            createNavigaionController(for: PersonsViewController(), title: NSLocalizedString("Persons", comment: ""), image:
                UIImage(systemName: "person.fill")!),
            createNavigaionController(for: AboutMeViewController(), title: NSLocalizedString("About Me", comment: ""), image: UIImage(systemName: "person.2.circle.fill")!)
        ]
    }
}
