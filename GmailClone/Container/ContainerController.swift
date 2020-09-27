//
//  ContainerController.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-22.
//


import UIKit


class ContainerController: UIViewController  {
    var menuController, centerController : UIViewController!
    var isExpanded = false

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
        centerController = UINavigationController(rootViewController: homeViewController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
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
    func showMenuController(shouldExpand: Bool){
        if (shouldExpand) {

            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.size.width - 80
            }, completion: nil)

        }else {
            //hide
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }, completion: nil)
        }

    }

}


extension ContainerController : HomeControllerDelegate {
    func handleMenuToggle() {
        if (!isExpanded) { // false
            configureMenuController()
        }
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }


}
