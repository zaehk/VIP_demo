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
    
    struct MovieDetail {
        static let reviewAuthor = "review_author".localized()
        static let rating = "review_rating".localized()
    }
    
    struct Search {
        static let searchBarPlaceholder: String = "searchbar_placeholder".localized()
    }
    
    struct EmptyState {
        struct descriptions {
            static let home: String = "home_empty".localized()
            static let movieDetail: String = "movie_empty".localized()
            static let search: String = "search_empty".localized()
        }
        struct images {
            static let home: UIImage? = UIImage(named: "homeEmptyState")
            static let search: UIImage? = UIImage(named: "searchEmptyState")
            static let detail: UIImage? = UIImage(named: "movieDetailEmptyState")
        }
    }
    
    struct Styles {
        static let mainColor: UIColor = .systemRed
        static let titleColor: UIColor = .white
        static let tabbarUnselectColor: UIColor = .white
        static let backGroundColor: UIColor = .black
        static let textInfoColor: UIColor = .white
        static let ratingColor: UIColor = .white
        static let tabbarStyleColor: UIBarStyle = .black
        static let reviewAuthorColor: UIColor = .white
        static let reviewTextColor: UIColor = .white
        static let reviewBackgroundColor: UIColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
        static let emptyStateImageTint: UIColor = .red
    }

}



