//
//  NicknameViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/13/24.
//

import UIKit
import SnapKit

class NicknameViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height * 0.5, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
        
        setupLayout()
        nicknameTextField.delegate = self
    }
    
    private func setupLayout(){
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(nicknameTextField)
        view.addSubview(finishButton)
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(-292)
            $0.left.equalToSuperview().offset(-921)
            $0.width.equalTo(200)
            $0.height.equalTo(27)
        }
        nicknameTextField.snp.makeConstraints{
            $0.top.equalToSuperview().offset(-244)
            $0.left.equalTo(titleLabel.snp.left)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        finishButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(-244)
            $0.left.equalTo(titleLabel.snp.left)
            $0.width.equalTo(332.34)
            $0.height.equalTo(52)
        }
        
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Regular", size: 23)
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "닉네임"
        textField.backgroundColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        textField.clearButtonMode = .always
        return textField
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        let regex = "^[가-힣]{1, 10}*$"
        let isValid = newText.range(of: regex, options: .regularExpression) != nil
        finishButton.isEnabled = isValid
        return true
    }
    
    private let finishButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        button.isEnabled = false
        button.backgroundColor = UIColor(red: 1, green: 20/255, blue: 60/255, alpha: 1)
        return button
    }()
    
    /*
    func configureFinishButton() {
        if nicknameTextField.text?.isEmpty ?? true {
            finishButton.isEnabled = false
        } else {
            finishButton.isEnabled = true
        }
    }
     */
    
    @objc func finishButtonTapped(){
        LoginViewController().nickname = nicknameTextField.text
        self.dismiss(animated: true)
    }
    

}
