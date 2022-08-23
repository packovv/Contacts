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
                UIImage(systemName: "person.fill")!)
        ]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
