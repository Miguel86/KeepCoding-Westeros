//
//  AppDelegate.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregale on 08/02/2018.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var detailControllers: [UINavigationController]!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()
        
        
        // Crear el modelo
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        /* Variante con tabs
        // Creamos los combinadores
        let tabBarViewController = UITabBarController()
        
        tabBarViewController.viewControllers =
            houses
              .map{ HouseDetailViewController(model: $0) }
              .map{ $0.wrappedInNavigation()}
        
        // Asignamos el rootVC
        window?.rootViewController = tabBarViewController
        */
        
        ///* Variante con lista */
        //let houseListViewController = HouseListViewController(model: houses)
        //
        //let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        ////let houseDetailViewControoler = HouseDetailViewController(model: houses.first!)
        //let houseDetailViewControoler = HouseDetailViewController(model: lastSelectedHouse)
        //
        ////Asignamos delegator
        //houseListViewController.delegate = houseDetailViewControoler
        //
        ////Crear el UISplitVC y le asignamos los View Controllers
        //let splitViewController = UISplitViewController()
        //splitViewController.viewControllers = [houseListViewController.wrappedInNavigation(), houseDetailViewControoler.wrappedInNavigation()] //Master -> Detail
        //
        ////Asignamos el rootVC
        ////window?.rootViewController = houseListViewController.wrappedInNavigation()
        //window?.rootViewController = splitViewController
        
        //Temporadas
        //let seasonListViewController = SeasonListViewController(model: seasons)
        //window?.rootViewController = seasonListViewController.wrappedInNavigation()
        //Vistas maestras
        let houseListViewController = HouseListViewController(model: houses)
        let seasonListViewController = SeasonListViewController(model: seasons)
        
        let mainVC = MainTBViewController(seasonListVC: seasonListViewController, houseListVC: houseListViewController)
        mainVC.delegate = self
        
        //Vistas de detalles
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        let houseDetailViewControoler = HouseDetailViewController(model: lastSelectedHouse)
        //Asignamos delegado
        houseListViewController.delegate = houseDetailViewControoler
        
        
        let lastSelectedSeason = seasonListViewController.lastSelectedSeason()
        let seasonDetailViewController = SeasonDetailViewController(model: lastSelectedSeason)
        //Asignamos delegado
        seasonListViewController.delegate = seasonDetailViewController
        
        detailControllers = [houseDetailViewControoler.wrappedInNavigation(), seasonDetailViewController.wrappedInNavigation()]
        
        //Split View Controller
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [mainVC, detailControllers.first!]
        splitViewController.delegate = self
        
        window?.rootViewController = splitViewController
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

// MARK: - UITabBarControllerDelegate
extension AppDelegate: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let splitViewController = window?.rootViewController as? UISplitViewController, splitViewController.viewControllers.count > 1 {
            splitViewController.viewControllers[1] = detailControllers[tabBarController.selectedIndex]
        }
    }
    
}

// MARK: - UISplitViewControllerDelegate
extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
