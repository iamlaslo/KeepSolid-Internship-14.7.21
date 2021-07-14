//
//  DetailsViewController.swift
//  KeepSolid-Internship-14.7.21
//
//  Created by Vlad Kozlov on 14.7.2021.
//

import UIKit

// for delegate
protocol DetailDataSource {
    func getString() -> String
}


class DetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var textString: String = ""
    
    // creating var of delegate protocol
    // "dataSource" if it's input
    // "delegate" if it's output
    var dataSource: DetailDataSource?
    
    var setString: (() -> String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // as string
        textLabel.text = textString
        
        // as delegate (prior)
        textLabel.text = dataSource?.getString()
        
        // as closure
        textLabel.text = setString?()
    }
    
    //MARK: - ? print works too but no .show
    @IBAction func testClicked(_ sender: UIButton) {
        print("testClicked")
        
        let vc = getViewControllerByID("testVC") as! TestViewController
        print(vc)
        print(navigationController)
        navigationController?.show(vc, sender: self)
    }
    
}


