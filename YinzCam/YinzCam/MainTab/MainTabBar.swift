//
//  MainTabBar.swift
//  YinzCam
//
//  Created by Kyo on 1/11/21.
//
import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate {
    // MARK:- Properties
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.delegate = self
        configureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Configures
    private func configureTabBar() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .orange
//
//        let homeTab = barTabView(view: HomeVC(), image: "home")
//        let serachTab = barTabView(view: SearchVC(), image: "search")
//        let favoriteTab = barTabView(view: FavoriteVC(), image: "heart")
//        let myPageTab = barTabView(view: MyPageVC(), image: "setting")
//        
//        viewControllers = [homeTab, serachTab, favoriteTab, myPageTab, ]
    }
    
    // MARK:- Helpers
//    func barTabView(view: UIViewController, image: String, width: CGFloat = 30, height: CGFloat = 30) -> UINavigationController {
//        let tabView = UINavigationController(rootViewController: view)
//        tabView.tabBarItem.image = UIImage(named: image)?.scaledDown(into: CGSize(width: width, height: height))
//        tabView.navigationBar.isHidden = true
//        return tabView
//    }
    
}
