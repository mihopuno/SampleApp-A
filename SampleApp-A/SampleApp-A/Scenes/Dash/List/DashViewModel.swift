//
//  DashViewMdoel.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

class DashViewModel : NSObject {
    
    private var delegate : DashListViewDelegate?
    private var rewardList : [RewardModel]
    var numberOfRows : Int { return rewardList.count }
    
    init(_ delegate : DashListViewDelegate) {
        self.delegate = delegate
        self.rewardList = []
    }
    
    func dashProfile() {
        NetworkRequest.shared.request(type: APIRoutes.Dash.userDashProfile()) { (result) in
            switch result{
            case .success(let user):
                self.delegate?.onUserDashProfileFetched(user.data.user)
                break
            case .failure(_): break
            }
        }
    }
    
    func rewardsList() {
        NetworkRequest.shared.request(type: APIRoutes.Dash.rewardList()) { (result) in
            switch result{
            case .success(let rewards):
                self.rewardList = rewards.data.list
                self.delegate?.onRewardListFetched()
                break
            case .failure(_): break
            }
        }
    }
    
    func getReward(_ index: Int) -> RewardModel {
        return rewardList[index]
    }
}
