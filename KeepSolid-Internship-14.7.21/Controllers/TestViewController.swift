//
//  TestViewController.swift
//  KeepSolid-Internship-14.7.21
//
//  Created by Vlad Kozlov on 14.7.2021.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var backClicked: UIButton!
    
    @IBAction func backClick(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
