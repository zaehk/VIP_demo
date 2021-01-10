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
        
        self.tabBar.barStyle = Constants.Styles.tabbarStyleColor
        self.tabBar.tintColor = Constants.Styles.mainColor
        self.tabBar.unselectedItemTintColor = Constants.Styles.tabbarUnselectColor
        self.tabBar.isTranslucent = false
        
        let newFilmReleases = HomeViewController()
        newFilmReleases.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.home , image: UIImage.init(named: "home_item"), tag: 0)
        let homeNavigationController = CustomNavigationController.init(rootViewController: newFilmReleases)
        
        let upcomingMovies = UIViewController()
        upcomingMovies.view.backgroundColor = Constants.Styles.backGroundColor
        upcomingMovies.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.soon , image: UIImage.init(named: "upcoming_item"), tag: 1)

        let search = UIViewController()
        search.view.backgroundColor = Constants.Styles.backGroundColor
        search.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.search , image: UIImage.init(named: "search_item"), tag: 2)

        let trending = UIViewController()
        trending.view.backgroundColor = Constants.Styles.backGroundColor
        trending.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.about , image: UIImage.init(named: "about_item"), tag: 3)
        
        let tabBarList = [homeNavigationController, search, upcomingMovies, trending]

        viewControllers = tabBarList
    }
    
}
