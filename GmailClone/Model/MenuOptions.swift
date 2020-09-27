//
//  MenuOptions.swift
//  GmailClone
//
//  Created by Habib Durodola on 2020-09-27.
//
import UIKit
enum MenuOption: Int , CustomStringConvertible {


    case Profile
    case Inbox
    case Notification
    case Settings

    var description: String {
        switch self {

        case .Profile: return "Profile"
        case .Inbox: return "Inbox"
        case .Notification: return "Notification"
        case .Settings: return "Settings"
        }
    }

    var image: UIImage {
        switch self {

        case .Profile: return UIImage(named: "Profile") ?? UIImage()
        case .Inbox: return UIImage(named: "Inbox") ?? UIImage()
        case .Notification: return UIImage(named: "Notification") ?? UIImage()
        case .Settings: return UIImage(named: "Setting") ?? UIImage()
        }
    }
}
