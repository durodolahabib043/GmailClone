//
//  SettingsController.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-27.
//

import UIKit

class SettingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        configureNavigation()
    }

    @objc func dismissSetting(){
        dismiss(animated: true, completion: nil)
    }

    fileprivate func configureNavigation(){
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.barStyle  = .blackOpaque
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Side Menu"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburgerIcon")    , style: .plain, target: self, action: #selector(dismissSetting))


    }

}
