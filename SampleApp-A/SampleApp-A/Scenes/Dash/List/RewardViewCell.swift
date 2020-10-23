//
//  RewardViewCell.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import UIKit

class RewardViewCell: UICollectionViewCell {

    @IBOutlet private weak var rewardImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var viewContainer: UIView!
    
    func configure(_ rewardModel: RewardModel) {
        descriptionLabel.text = rewardModel.description
        rewardImageView.image = UIImage(named: "placeholder")
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContainer.addCornerRadius(5)
        viewContainer.elevate(elevation: 3)
        viewContainer.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
