//
//  MissionListViewModel.swift
//  Moonshot
//
//  Created by ebpearls on 26/12/2022.
//

import Foundation
import Combine

class MissionListViewModel: BaseViewModel {

    // MARK: properties
    @Published var missions = [Mission]()
    
    // MARK: getMissions
    func getMissions() {
        missions = Bundle.main.decode(.missions)
    }
    
}
