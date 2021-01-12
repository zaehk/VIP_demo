//
//  BaseViewController.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 20/12/2020.
//

import UIKit
import ProgressHUD

protocol BaseViewDisplayLogic{
    func showErrorAlert(error: APIErrorType)
    func showInfoAlert()
}

class BaseViewController: UIViewController, BaseViewDisplayLogic {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constants.Styles.backGroundColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func showErrorAlert(error: APIErrorType) {

    }
    
    func showInfoAlert() {
        
    }
    
    func showSpinner() {
        ProgressHUD.show("Loading")
    }
    
    func hideSpinner() {
        ProgressHUD.dismiss()
    }
    
    
    
}
