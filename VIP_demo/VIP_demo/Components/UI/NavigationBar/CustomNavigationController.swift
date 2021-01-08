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
        self.navigationBar.barStyle = .black
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = .red
    }
    
}
