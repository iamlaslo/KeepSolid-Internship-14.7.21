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
    @IBOutlet weak var weatherView: WeatherHeaderView!
    
    var textString: String = ""
    
    // creating var of delegate protocol
    // "dataSource" if it's input
    // "delegate" if it's output
    var dataSource: DetailDataSource?
    
    var setString: (() -> String)?
    
    var data: Array = Array<String>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // as string
        textLabel.text = textString
        
        // as delegate (prior)
        textLabel.text = dataSource?.getString()
        
        // as closure
        textLabel.text = setString?()
        
        for _ in 0...15 {
            data.append(String(Int.random(in: -40...40)))
        }
        
        weatherView.imageView.image = UIImage(named: "img")
    }
    
    @IBAction func testClicked(_ sender: UIButton) {        
        let vc = getViewControllerByID("testVC") as! TestViewController
        navigationController?.show(vc, sender: self)
    }
}


// MARK: - DetailViewController: UICollectionViewDelegate
extension DetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let message = "Item at \(indexPath.item) index was selected. \n Temp = \(data[indexPath.item])"
        let alert = UIAlertController(title: "Selected", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - DetailViewController: UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailyWeatherCell", for: indexPath) as! DailyWeatherCollectionCell
        
        cell.imageView.image = UIImage(named: "img")
        
        cell.tempLabel.text = String(format: "%@%@", data[indexPath.item],  "\u{00B0}")
        
        let dtf = DateFormatter()
        dtf.dateStyle = .medium
        dtf.timeStyle = .none
        cell.dateLabel.text = dtf.string(from: Date())
        
        
        return cell
    }
}


