//
//  HomeViewContainer.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-22.
//

import Foundation
import UIKit

class HomeViewContainer: UIViewController {

    //MARK:- init

    //MARK:- propertise
    var delegate : HomeControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        configureNavigationBar()


    }

    @objc func handleMenuToggle() {
        print("handleMenuToggle")
        delegate?.handleMenuToggle(menuOption: nil)
    }

    fileprivate func configureNavigationBar(){
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.barStyle  = .blackOpaque
        navigationItem.title = "Side Menu"

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hamburgerIcon")    , style: .plain, target: self, action: #selector(handleMenuToggle))


    }

}

