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

        let search = MovieSearchViewController()
        search.view.backgroundColor = Constants.Styles.backGroundColor
        search.tabBarItem = UITabBarItem.init(title: Constants.TabbarTitles.search , image: UIImage.init(named: "search_item"), tag: 1)
        
        let tabBarList = [homeNavigationController, search]

        viewControllers = tabBarList
    }
    
}
