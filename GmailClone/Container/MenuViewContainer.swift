//
//  MenuViewContainer.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-22.
//


import UIKit

private let identifier = "menuIdentifier"

class MenuViewContainer: UIViewController {

    //MARK:- init
    let tableView = UITableView()
    var delegate: HomeControllerDelegate?

    //MARK:- propertise

    //MARK:- handlers

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setuptablewView()

    }

    fileprivate func setuptablewView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuContainerCell.self, forCellReuseIdentifier: identifier)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        view.addSubview(tableView)
        addTableContraint()
    }

    fileprivate func addTableContraint(){
        var constraint = [NSLayoutConstraint]()

        //MARK: - tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false// MAKE SURE TO ADD THIS AT ALL TIMES
        constraint += [NSLayoutConstraint (item: tableView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        constraint += [NSLayoutConstraint (item: tableView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        constraint += [NSLayoutConstraint (item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        constraint += [NSLayoutConstraint (item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]

        view.addConstraints(constraint)

    }

}

extension MenuViewContainer : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4   
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MenuContainerCell
        let menu = MenuOption.init(rawValue: indexPath.row)

        cell.cellLabel.text = menu?.description
        cell.iconImageView.image = menu?.image
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        let menu = MenuOption.init(rawValue: indexPath.row)
        delegate?.handleMenuToggle(menuOption: menu)
    }


}

