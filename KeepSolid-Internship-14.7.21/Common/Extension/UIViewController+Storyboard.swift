//
//  UIViewController+Storyboard.swift
//  KeepSolid-Internship-14.7.21
//
//  Created by Vlad Kozlov on 14.7.2021.
//

import UIKit

extension UIViewController {
    func getViewControllerByID(_ id: String) -> UIViewController {
        // creating global storyboard link
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: id)
    }
}
