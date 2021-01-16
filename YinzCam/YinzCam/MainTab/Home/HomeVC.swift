//
//  HomeVC.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    // MARK:- Properties
    private let schedulesCVC = SchedulesCVC()
    override func viewDidLoad() {
        configure()
        configureUI()
    }
    
    private func configure() {
        view.backgroundColor = .red
        schedulesCVC.delegate = self
    }
    
    private func configureUI() {
        guard let schedulesCVC = schedulesCVC.view
        else { return }
        view.addSubview(schedulesCVC)
        schedulesCVC.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        API.fetchLocalSchedule { response in
            
            
        }
        
    }
    
}

extension HomeVC: SchedulesCVCDelegate {
    func cellTapped(index: Int) {
        print("DEBUG:- \(index)")
    }
}
