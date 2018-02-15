//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 13/02/2018.
//  Copyright © 2018 Miguel Dos Santos Carregal. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
