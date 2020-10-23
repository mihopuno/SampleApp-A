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
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!
    
    private var detailsViewController : RewardDetailsViewController?
    
    private lazy var viewModel : DashViewModel = { ()
        return DashViewModel(self)
    }()
    
    class func view() -> UINavigationController {
        let viewController = DashListViewController.instantiate(fromStoryboard: .Dash)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func configureViews() {
        collectionView.register(nib: RewardViewCell.self)
        collectionView.delegate = self
        let width = collectionView.frame.width - 64
        let height = collectionView.frame.height / 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: -8)
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionView.collectionViewLayout = layout
        collectionView.layoutIfNeeded()
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

extension DashListViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rewardModel = viewModel.getReward(indexPath.row)
        if detailsViewController == nil {
            detailsViewController = RewardDetailsViewController.view(rewardModel)
        } else {
            detailsViewController?.updateReward(rewardModel)
        }
        self.navigationController?.pushViewController(detailsViewController!, animated: true)
    }
}
