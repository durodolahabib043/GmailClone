//
//  ContainerController.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-22.
//


import UIKit


class ContainerController: UIViewController  {
    var menuController : UIViewController!

    //MARK:- init
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureHomeController()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func configureHomeController() {
        let homeViewController = HomeViewContainer()
        homeViewController.delegate = self
        let controller = UINavigationController(rootViewController: homeViewController)
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }

    func configureMenuController(){
        if menuController == nil {
            menuController = MenuViewContainer()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }

    //MARK:- propertise

}


extension ContainerController : HomeControllerDelegate {
    func handleMenuToggle() {
        configureMenuController()
    }


}
