//
//  MainViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/20/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTitleViewLayout()
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    /*
    private let contentView : UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
     */
    
    private func setupLayout(){
        /*
        view.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
         */
        /// !!!!!!!! 왜????? scrollView 안에 넣으려 했는데 scrollview 안에 posterView를 넣으면 posterview cell 자체가 initialize이 안 됨
        
        [posterView, titleView, headerView, seriesView].forEach{
            self.view.addSubview($0)
        }
        
        
        titleView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(94)
        }
        headerView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleView.snp.bottom).offset(4)
            $0.height.equalTo(37)
        }
        posterView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(view.safeAreaInsets.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.width*1.425)
        }
        seriesView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(posterView.snp.bottom)
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
    
    private lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }() //홈 시리즈 .. -> 일단 냅둬
    
    private lazy var posterView : UICollectionView  = PosterCollectionView()
    
    private lazy var seriesView : UICollectionView = {
        let collecitonView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collecitonView
    }()

}

