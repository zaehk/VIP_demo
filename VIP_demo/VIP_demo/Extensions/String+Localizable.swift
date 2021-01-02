//
//  String+Localizable.swift
//  VIP_demo
//
//  Created by Borja Saez de Guinoa Vilaplana on 02/01/2021.
//

import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
