//
//  SchedulesCVC.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//

import UIKit

protocol SchedulesCVCDelegate: class {
    func cellTapped(index: Int)
}

class SchedulesCVC: UICollectionViewController {
    private let reuseIdentifier = "scheduleCell"
    private var schedules = ""
    
    public var delegate: SchedulesCVCDelegate?
    public var teamInfo: API.Team?
    public var gameSection = [API.GameSection]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout = UICollectionViewLayout()) {
        let myLayout = UICollectionViewFlowLayout()
        myLayout.scrollDirection = .vertical
        myLayout.minimumLineSpacing = 16
//        myLayout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        super.init(collectionViewLayout: myLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configure()
    }
    
    private func configure() {
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        collectionView.register(ScheduleCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

extension SchedulesCVC: UICollectionViewDelegateFlowLayout {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return gameSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: 156 * ratio)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(gameSection.count > 0) {
            return gameSection[section].games?.count ?? 0
        } else {
            return 5
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ScheduleCell
        //cell.receipt = receipts[indexPath.row]
        cell.applyData(teamInfo: teamInfo, game: gameSection[indexPath.section].games?[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.cellTapped(index: indexPath.row)
    }
    
}
