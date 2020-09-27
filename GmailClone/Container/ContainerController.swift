//
//  ContainerController.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-22.
//


import UIKit


class ContainerController: UIViewController  {
    var menuController : MenuViewContainer!
    var centerController : UIViewController!
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

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

    override var prefersStatusBarHidden: Bool {
        return isExpanded
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
            menuController.delegate = self
            
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controller")
        }
    }

    //MARK:- propertise
    func showMenuController(shouldExpand: Bool , menuOption : MenuOption?){
        if (shouldExpand) {

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.size.width - 80
            }, completion: nil)

        }else {
            //hide
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x = 0
            } completion: { (_) in
                guard let menu = menuOption else {
                    return
                }

                self.didSelectMenuOption(menuOption: menu)
            }

        }

        animateStatusBar()

    }
    func didSelectMenuOption(menuOption : MenuOption){
        switch menuOption {
        case .Profile:
            print("Profile")
        case .Inbox:
            print("Inbox")
        case .Notification:
            print("Notification")
        case .Settings:
            print("Settings")
        }
    }

    func animateStatusBar(){

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)

    }

}


extension ContainerController : HomeControllerDelegate {
    func handleMenuToggle(menuOption: MenuOption?) {
        if (!isExpanded) { // false
            configureMenuController()
        }
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded , menuOption:  menuOption )
    }
}
