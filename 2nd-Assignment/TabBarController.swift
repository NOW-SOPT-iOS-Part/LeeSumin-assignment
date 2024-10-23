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
    private let dailyMovieViewController: UINavigationController = {
        let rootView = DailyMovieView() // DailyMovieView 초기화
        let dailyMovieRepository = DailyMovieRepository(service: DailyMovieService.shared)
        let viewModel = DailyMovieViewModel(useCase: DailyMovieUseCase(repository: dailyMovieRepository))
        let dailyVC = DailyMovieViewController(rootView: rootView, viewModel: viewModel)
        return UINavigationController(rootViewController: dailyVC)
    }()
    
    private func setVC(){
        self.setViewControllers([homeViewController, dailyMovieViewController], animated: true)
        
        if let items = self.tabBar.items{
            items[0].title = "홈"
            items[0].image = UIImage(systemName: "house")
            items[0].selectedImage = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
            
            items[1].title = "오늘의 영화"
            items[1].image = UIImage(systemName: "popcorn")
            items[1].selectedImage = UIImage(systemName: "popcorn.fill")?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
        }
        
    }
}
