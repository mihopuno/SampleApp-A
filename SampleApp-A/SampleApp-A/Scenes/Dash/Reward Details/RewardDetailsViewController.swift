//
//  RewardDetailsViewController.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

class RewardDetailsViewController: UIViewController {

    @IBOutlet private weak var rewardImageView: UIImageView!
    @IBOutlet private weak var rewardLabel: UILabel!
    @IBOutlet private weak var rewardDescriptionLabel: UILabel!
    
    private var rewards : RewardModel!
    
    class func view(_ reward: RewardModel) -> RewardDetailsViewController {
        let view = RewardDetailsViewController.instantiate(fromStoryboard: .Dash)
        view.rewards = reward
        return view
    }
    
    func updateReward(_ reward: RewardModel) {
        self.rewards = reward
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBarItem()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
        configure()
    }
    
    private func configure() {
        rewardImageView.image = UIImage(named: "placeholder")
        rewardLabel.text = rewards.name
        rewardDescriptionLabel.text = rewards.description
    }
    
    private func configureNavigationBarItem() {
        let shareBarItem = UIBarButtonItem(barButtonSystemItem: .action,
                                           target: self,
                                           action: #selector(onTappedBarItem))
        self.navigationItem.rightBarButtonItem = shareBarItem
    }
    
    @objc private func onTappedBarItem() {
        self.showAlertView("Share", "Share rewards")
    }
}
