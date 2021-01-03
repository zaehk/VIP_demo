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
        
        let newFilmReleases = HomeViewController()
        newFilmReleases.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.home , image: UIImage(), tag: 0)

        let seriesAiringNow = UIViewController()
        seriesAiringNow.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.soon , image: UIImage(), tag: 1)

        let trending = UIViewController()
        trending.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.about , image: UIImage(), tag: 2)
        
        let tabBarList = [newFilmReleases, seriesAiringNow, trending]

        viewControllers = tabBarList
    }
    
}
