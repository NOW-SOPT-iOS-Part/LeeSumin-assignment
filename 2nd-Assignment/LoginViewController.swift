//
//  ViewController.swift
//  2nd-Assignment
//
//  Created by 이수민 on 4/13/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController, SendNicknameProtocol{
    var nickname : String?
    
    func didEnterNickname(_ nickname: String?) {
        self.nickname = nickname
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextField.delegate = self
        pwTextField.delegate = self
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        setupLayout()
    }

    private func setupLayout(){
        view.addSubview(titleLabel)
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(clearPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(findID)
        view.addSubview(findPW)
        view.addSubview(noAccount)
        view.addSubview(nicknameButton)
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            //$0.width.equalTo(156)
            //$0.height.equalTo(37)
            $0.top.equalToSuperview().offset(90)
        }
        idTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.top.equalTo(titleLabel.snp.top).offset(64)
        }
        pwTextField.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.top.equalTo(idTextField.snp.top).offset(63)
        }
        showPasswordButton.snp.makeConstraints{
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.centerY.equalTo(pwTextField.snp.centerY)
            $0.trailing.equalTo(pwTextField.snp.trailing).inset(20)
        }
        clearPasswordButton.snp.makeConstraints{
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.centerY.equalTo(pwTextField.snp.centerY)
            $0.trailing.equalTo(showPasswordButton.snp.trailing).inset(36)
        }
        loginButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.top.equalTo(pwTextField.snp.top).offset(73)
        }
        findID.snp.makeConstraints{
            //$0.width.equalTo(62)
            $0.height.equalTo(22)
            $0.top.equalTo(loginButton.snp.top).offset(83)
            $0.leading.equalToSuperview().offset(92)
        }
        findPW.snp.makeConstraints{
            //$0.width.equalTo(73)
            $0.height.equalTo(22)
            $0.top.equalTo(findID.snp.top)
            $0.leading.equalToSuperview().offset(223)
        }
        noAccount.snp.makeConstraints{
            //$0.width.equalTo(129)
            $0.height.equalTo(22)
            $0.top.equalTo(findID.snp.top).offset(50)
            $0.leading.equalToSuperview().offset(51)
        }
        nicknameButton.snp.makeConstraints{
            //$0.width.equalTo(128)
            $0.height.equalTo(22)
            $0.top.equalTo(findID.snp.top).offset(50)
            $0.leading.equalTo(noAccount.snp.leading).offset(146)
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.font = UIFont(name: "Pretendard-Regular", size: 50)
        label.textColor = UIColor(named: "gray1")
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Pretendard-SemiBold", size: 15)!,
            .foregroundColor: UIColor(named: "gray2") ?? .systemGray
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: attributes)
        textField.backgroundColor = UIColor(named: "gray4")
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(padding: 17)
        
        return textField
    }()
    
    private let clearPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "x-in-circle")?.withTintColor(UIColor(named: "gray2") ?? .systemGray), for: .normal)
        button.addTarget(self, action: #selector(clearPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func clearPasswordButtonTapped(){
        pwTextField.text = ""
    }
    
    private let showPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eye")?.withTintColor(UIColor(named: "gray2") ?? .systemGray), for: .normal)
        button.setImage(UIImage(named: "eye-slash")?.withTintColor(UIColor(named: "gray2") ?? .systemGray), for: .selected)
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func showPasswordButtonTapped(){
        pwTextField.isSecureTextEntry.toggle()
        showPasswordButton.isSelected.toggle()
    }
    
    private let pwTextField: UITextField = {
        let textField = UITextField()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Pretendard-SemiBold", size: 15)!,
            .foregroundColor: UIColor(named: "gray2") ?? .systemGray
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: attributes)
        textField.backgroundColor = UIColor(named: "gray4")
        textField.isSecureTextEntry = true
        textField.rightViewMode = .always
        textField.layer.cornerRadius = 3
        textField.addLeftPadding(padding: 17)
        return textField
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.setTitleColor(UIColor(named: "gray1"), for: .normal)
        button.backgroundColor = UIColor(named: "BrandColor")
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private func changeLoginButtonColor(){
        loginButton.backgroundColor = .red
    }
    
    @objc func loginButtonTapped(){
        let vc = WelcomeViewController()
        if nickname != nil{
            vc.welcomeName = nickname
        }
        else{
            vc.welcomeName = idTextField.text
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private let findID : UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        label.textColor = UIColor(named: "gray2")
        return label
    }()
    
    private let findPW : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        label.text = "비밀번호 찾기"
        label.textColor = UIColor(named: "gray2")
        return label
    }()
    
    private let noAccount: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        label.textColor = UIColor(named: "gray3")
        return label
    }()
    
    private let nicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러 가기", for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.setTitleColor(UIColor(named: "gray2"), for: .normal)
        button.addTarget(self, action: #selector(nicknameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func nicknameButtonTapped(){
        let vc = NicknameViewController()
        setSheetLayout(for: vc)
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(named: "gray2")?.cgColor
        textField.layer.borderWidth = 1
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }
}
