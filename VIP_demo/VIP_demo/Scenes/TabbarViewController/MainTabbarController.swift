//
//  MainTabbarController.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //placeholders viewcontrollers
        
        let newFilmReleases = UIViewController()
        newFilmReleases.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 0)

        let seriesAiringNow = UIViewController()
        seriesAiringNow.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)

        let trending = UIViewController()
        trending.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 2)
        
        let tabBarList = [newFilmReleases, seriesAiringNow, trending]

        viewControllers = tabBarList
    }
    
}
