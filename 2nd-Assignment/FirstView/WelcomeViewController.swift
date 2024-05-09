//
//  WelcomeViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/17/24.
//

import UIKit

import SnapKit

class WelcomeViewController: UIViewController {

    var welcomeName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        welcomeLabel.text = "\(welcomeName ?? "00")님\n반가워요!"
        setupLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setupLayout(){
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(brandImage)
        view.addSubview(welcomeLabel)
        view.addSubview(mainButton)
        brandImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(102)
            $0.leading.trailing.equalToSuperview()
        }
        welcomeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(336)
            $0.centerX.equalToSuperview()
        }
        mainButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(694)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    private let brandImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "BrandImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor(named: "gray1")
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        return label
    }()
    
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BrandColor")
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
        return button
    }()

    @objc private func mainButtonTapped(){
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
