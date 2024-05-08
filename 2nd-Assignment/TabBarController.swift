//
//  TabBarViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/20/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .black
        navigationItem.hidesBackButton = true
        setVC()
        // Do any additional setup after loading the view.
    }
    
    private let homeViewController = UINavigationController(rootViewController: HomeViewController())
    
    private func setVC(){
        self.setViewControllers([homeViewController], animated: true)
        
        if let items = self.tabBar.items{
            items[0].title = "홈"
            items[0].image = UIImage(systemName: "house")
            items[0].selectedImage = UIImage(systemName: "house.fill")?.withTintColor(.white) //왜 하얀색 안 되지
        }
        
    }
}
