//
//  MainViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/20/24.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    private let headerView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let homeView : UIView = {
        let view = UIView()
        return view
    }()
}
