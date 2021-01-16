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
    private var gameList: API.GameList? {
        didSet {
            schedulesCVC.collectionView.reloadData()
        }
    }
    private let navBar = UIView()
    private let hamburgerMenu = UIImageView()
    private let schedulesCVC = SchedulesCVC()
    
    override func viewDidLoad() {
        configure()
        configureUI()
        fetchGameList()
    }
    
    private func configure() {
        view.backgroundColor = .red
        schedulesCVC.delegate = self
    }
    
    private func configureUI() {
        guard let schedulesCVC = schedulesCVC.view
        else { return }
        
        view.addSubview(navBar)
        navBar.backgroundColor = .blue
        navBar.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        view.addSubview(schedulesCVC)
        schedulesCVC.snp.makeConstraints { make in
            make.top.equalTo(navBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    
    }
    
    private func fetchGameList() {
        API.fetchLocalSchedule { [weak self] response in
            guard let strongSelf = self,
                  let teamInfo = response?.team,
                  let gameSection = response?.gameSections
            else { return }
            //strongSelf.gameList = response
            strongSelf.schedulesCVC.teamInfo = teamInfo
            strongSelf.schedulesCVC.gameSection = gameSection
        }
    }
    
}

extension HomeVC: SchedulesCVCDelegate {
    func cellTapped(index: Int) {
        print("DEBUG:- \(index)")
    }
}
