//
//  DashListViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

class DashListViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var referalCodeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    class func view() -> UIViewController {
        let viewController = DashListViewController.instantiate(fromStoryboard: .Dash)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
    
    private func configureViews() {
        collectionView.register(nib: RewardViewCell.self)
    }
}

extension DashListViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RewardViewCell", for: indexPath) as! RewardViewCell
        return cell
    }
}
