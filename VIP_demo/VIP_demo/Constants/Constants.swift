//
//  Constants.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import UIKit

struct Constants{
    
    struct TabbarTitles {
        static let home = "tabbar_item_home".localized()
        static let soon = "tabbar_item_soon".localized()
        static let search = "tabbar_item_search".localized()
        static let about = "tabbar_item_about".localized()
    }
    
    struct HomeCategories {
        static let popular = "category_popular".localized()
        static let topRated = "category_topRated".localized()
        static let newReleases = "category_newReleases".localized()
        static let upcoming = "category_upcoming".localized()
    }
    
    struct MovieDetailCategories {
        static let actors = "category_actors".localized()
        static let crew = "category_crew".localized()
        static let reviews = "category_reviews".localized()
    }
    
    struct Styles {
        static let mainColor: UIColor = .systemBlue
        static let titleColor: UIColor = .white
        static let tabbarUnselectColor: UIColor = .white
        static let backGroundColor: UIColor = .black
        static let textInfoColor: UIColor = .white
        static let tabbarStyleColor: UIBarStyle = .black
    }

}



