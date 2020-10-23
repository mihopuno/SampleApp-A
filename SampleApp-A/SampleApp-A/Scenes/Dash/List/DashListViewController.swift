//
//  DashListViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

protocol DashListViewDelegate: class {
    func onUserDashProfileFetched(_ user: UserModel)
    func onRewardListFetched()
}

class DashListViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var referalCodeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private lazy var viewModel : DashViewModel = { ()
        return DashViewModel(self)
    }()
    
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
        viewModel.dashProfile()
        viewModel.rewardsList()
    }
}

extension DashListViewController : DashListViewDelegate {
    func onUserDashProfileFetched(_ user: UserModel) {
        userNameLabel.text = user.fullName
        mobileNumberLabel.text = user.mobile
        referalCodeLabel.text = user.referralCode
    }
    
    func onRewardListFetched() {
        collectionView.reloadData()
    }
}

extension DashListViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RewardViewCell", for: indexPath) as! RewardViewCell
        cell.configure(viewModel.getReward(indexPath.row))
        return cell
    }
}
