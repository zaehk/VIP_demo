//
//  BaseViewController.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import UIKit

protocol BaseViewDisplayLogic{
    func showError(error: APIErrorType)
    func showInfo()
}

class BaseViewController: UIViewController, BaseViewDisplayLogic {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func showError(error: APIErrorType) {

    }
    
    func showInfo() {
        
    }
    
    
    
}
