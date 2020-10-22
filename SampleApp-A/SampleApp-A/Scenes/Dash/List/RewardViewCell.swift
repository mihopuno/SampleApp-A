//
//  RewardViewCell.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/22/20.
//

import UIKit

class RewardViewCell: UITableViewCell {

    @IBOutlet weak var rewardsImageView: UIImageView!
    @IBOutlet weak var rewardLabel: UILabel!
    
    func configure() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
