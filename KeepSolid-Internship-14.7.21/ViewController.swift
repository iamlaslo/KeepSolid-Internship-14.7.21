//
//  ViewController.swift
//  KeepSolid-Internship-14.7.21
//
//  Created by Vlad Kozlov on 14.7.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func buttonClick(_ sender: Any) { 
        let vc = getViewControllerByID("detailVC")  as! DetailViewController
        
        
//        // as string
//        vc.textString = "Text"
        
        // as delegate
        // connects both view controllers between themselves
        vc.dataSource = self
        
        navigationController?.show(vc, sender: self)
        
        // as closure
        vc.setString = {
            return "Closure text"
        }
    }
    
    
//    // different animation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetailVC" {
//            let vc = segue.destination as! DetailViewController
//            vc.textString = "Text"
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
}



// MARK: - Extension DetailDataSource
// creating the realization of delegate func
extension ViewController: DetailDataSource {
    func getString() -> String {
        return "Delegate text"
    }
}

