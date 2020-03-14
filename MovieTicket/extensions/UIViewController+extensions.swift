//
//  UIViewController+instantiateFrom.swift
//  GarbageCalendar
//
//  Created by Norihiko Oba on 2018/03/01.
//  Copyright © 2018年 Norihiko Oba. All rights reserved.
//

import Foundation
import UIKit

protocol StoryBoardInstantiatable {}
extension UIViewController: StoryBoardInstantiatable {}

extension StoryBoardInstantiatable where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: self.className, bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as? Self {
            return viewController
        } else {
            fatalError()
        }
    }

    static func instantiate(withStoryboard storyboard: String) -> Self {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: self.className) as? Self {
            return viewController
        } else {
            fatalError()
        }
    }
}

extension UIViewController {
    func alert(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
