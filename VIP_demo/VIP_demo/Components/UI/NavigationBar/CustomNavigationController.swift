//
//  CustomNavigationController.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 08/01/2021.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        setupStyle()
    }
    
    private func setupStyle(){
        self.navigationBar.barStyle = Constants.Styles.tabbarStyleColor
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = Constants.Styles.mainColor
        let textAttributes = [NSAttributedString.Key.foregroundColor:Constants.Styles.mainColor]
        self.navigationBar.titleTextAttributes = textAttributes
    }
    
}
