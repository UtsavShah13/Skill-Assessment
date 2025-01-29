//
//  MatchDetailViewModel.swift
//  Skill-Assessment
//
//  Created by Utsav Shah on 29/01/25.
//

import Foundation

class MatchDetailsViewModel: ObservableObject {
    
    @Published var matchDetails: MatchDetailResponse?

    
    init () {
        
    }

    func getMatches() {
        NetworkManager.shared.getMatchDetail1API { [weak self] result in
            print(result as Any)
            self?.matchDetails = result
        }
    }
    
    func getOtherMatches() {
        NetworkManager.shared.getMatchDetail2API { [weak self] result in
            print(result as Any)
            self?.matchDetails = result
        }
    }
}
