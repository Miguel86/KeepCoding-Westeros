//
//  MainTBViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 2/3/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

class MainTBViewController: UITabBarController {
    // MARK: - Properties
    let seasonList: SeasonListViewController
    let houseList: HouseListViewController
    
    // MARK - Initialization
    init(seasonListVC: SeasonListViewController, houseListVC: HouseListViewController){
        self.seasonList = seasonListVC
        self.houseList = houseListVC
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //seasonList.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        houseList.tabBarItem = UITabBarItem(title: "Houses", image: UIImage(named: "Casas"), tag: 0)
        seasonList.tabBarItem = UITabBarItem(title: "Seasons", image: UIImage(named: "Temporadas"), tag: 1)
        
        
        let tabBarList = [houseList.wrappedInNavigation(), seasonList.wrappedInNavigation()]
        viewControllers = tabBarList  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
