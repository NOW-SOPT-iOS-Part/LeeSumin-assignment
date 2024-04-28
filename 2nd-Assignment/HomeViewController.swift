//
//  MainViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/20/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    var topInset : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0.0
        topInset = Int(navigationBarHeight + UIApplication.shared.statusBarFrame.height) //포인트!!!!!!
        
        setTitleViewLayout()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        scrollView.isDirectionalLockEnabled = true
        return scrollView
    }()
    
    private func setupLayout(){
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        /// !!!!!!!! 왜????? scrollView 안에 넣으려 했는데 scrollview 안에 posterView를 넣으면 posterview cell 자체가 initialize이 안 됨
        /// 안 됐었는데..? 
        /// 레이아웃이 이상해짐
        
        [posterView, titleView, headerView, posterCircleView, tvingEssentialHeaderView, tvingEssentialCollectionView, topChannelHeaderView, topChannelCollectionView, paramountContentHeaderView, paramountContentCollectionView ].forEach{
            scrollView.addSubview($0)
        }
        
        titleView.snp.makeConstraints{
            $0.top.equalTo(posterView.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(94)
        }
        headerView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.width.equalTo(UIScreen.main.bounds.width - 36)
            $0.top.equalTo(titleView.snp.bottom).offset(4)
            $0.height.equalTo(37)
        }
        posterCircleView.snp.makeConstraints{
            $0.top.equalTo(posterView.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(21)
            $0.width.equalTo(60)
            $0.height.equalTo(4)
        }
        posterView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(-self.topInset)
            $0.leading.trailing.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(UIScreen.main.bounds.width*1.425)
        }
        
        tvingEssentialHeaderView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.top.equalTo(posterView.snp.bottom).offset(49)
            $0.height.equalTo(23)
        }
        tvingEssentialCollectionView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.top.equalTo(tvingEssentialHeaderView.snp.bottom).offset(14)
            $0.height.equalTo(166)
        }
        
        topChannelHeaderView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.top.equalTo(tvingEssentialCollectionView.snp.bottom).offset(49)
            $0.height.equalTo(23)
        }
        topChannelCollectionView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.top.equalTo(topChannelHeaderView.snp.top).offset(31)
            $0.height.equalTo(138)
        }
        
        paramountContentHeaderView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.top.equalTo(topChannelCollectionView.snp.top).offset(156)
            $0.height.equalTo(23)
        }
        paramountContentCollectionView.snp.makeConstraints{
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.top.equalTo(paramountContentHeaderView.snp.top).offset(36)
            $0.height.equalTo(166)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    private lazy var titleImageView : UIView = {
        let imageView = UIImageView(image: UIImage(named: "tving_textlogo")?.withTintColor(UIColor(named: "lightPink") ?? .white))
        return imageView
    }()
    
    private lazy var profileImageView : UIView = {
        let imageView = UIImageView(image: UIImage(named: "doosanLogo"))
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private func setTitleViewLayout(){
        [titleImageView, profileImageView].forEach{
            self.titleView.addSubview($0)
        }
        titleImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(58)
            $0.leading.equalToSuperview().offset(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        profileImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(58)
            $0.trailing.equalToSuperview().inset(9)
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
    }
    
    private lazy var titleView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }() //addSubView : private let (x) /  private lazy var (o)
    
    
    private lazy var headerView : UIStackView  = HeaderView()
    private lazy var posterCircleView : UIStackView  = PosterCircleView()
    private lazy var posterView : UICollectionView  = PosterCollectionView()
    
    private lazy var tvingEssentialHeaderView : UIView = {
        let headerView = SeriesCollectionHeaderView()
        headerView.configure(withTitle: "티빙에서 꼭 봐야하는 콘텐츠")
        return headerView
    }()
    private lazy var tvingEssentialCollectionView : UICollectionView = SeriesCollectionView()
    
    private lazy var topChannelHeaderView: UIView = {
        let headerView = SeriesCollectionHeaderView()
        headerView.configure(withTitle: "인기 LIVE 채널")
        return headerView
    }()
    private lazy var topChannelCollectionView : UICollectionView = ChannelCollectionView()

    
    private lazy var paramountContentHeaderView: UIView = {
        let headerView = SeriesCollectionHeaderView()
        headerView.configure(withTitle: "1화 무료! 파라마운트+ 인기 시리즈")
        return headerView
    }()
    private lazy var paramountContentCollectionView : UICollectionView = SeriesCollectionView()

}

