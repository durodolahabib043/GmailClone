//
//  MenuContainerCell.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-27.
//

import UIKit

class MenuContainerCell: UITableViewCell {
    //MARK:- INIT

    let iconImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        return iv
    }()

    var cellLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = .green
        return label

    }()
    //MARK:- PROPERTIES

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconImageView)
        addSubview(cellLabel)
        addCellContraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK:- HANDLERS

    func addCellContraint()  {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.translatesAutoresizingMaskIntoConstraints = false

        var constraints = [NSLayoutConstraint]()

        let subView: [UIView] = [iconImageView , cellLabel]
        let stackView = UIStackView.init(arrangedSubviews: subView)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        //stackView.spacing = 10

        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        constraints += [NSLayoutConstraint.init(item: stackView, attribute: .leading, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: stackView, attribute: .top, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .trailing, multiplier: 1.0, constant: 0.0)]
        constraints += [NSLayoutConstraint.init(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0.0)]

        constraints += [NSLayoutConstraint.init(item: iconImageView, attribute: .width, relatedBy: .equal, toItem: stackView, attribute: .width, multiplier: 1/4, constant: 0.0)]

        //add constraints
        NSLayoutConstraint.activate(constraints)

    }

}







//private let increaseButton : UIButton = {
//    let btn = UIButton(type: .custom)
//    btn.setImage(#imageLiteral(resourceName: “addTb”), for: .normal)
//    btn.imageView?.contentMode = .scaleAspectFill
//    return btn
//}()
//var productQuantity : UILabel = {
//    let label = UILabel()
//    label.font = UIFont.boldSystemFont(ofSize: 16)
//    label.textAlignment = .left
//    label.text = “1”
//    label.textColor = .black
//    return label
//
//}()
//
//private let productImage : UIImageView = {
//    let imgView = UIImageView(image: #imageLiteral(resourceName: “glasses”))
//    imgView.contentMode = .scaleAspectFit
//    imgView.clipsToBounds = true
//    return imgView
//}()

