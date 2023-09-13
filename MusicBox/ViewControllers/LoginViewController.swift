//
//  LoginViewController.swift
//  MusicBox
//
//  Created by Айнур on 09.09.2023.
//

import UIKit

class LoginViewController: UIViewController {
    let backgroundImageView = UIImageView()
    let titleLogoLabel = UILabel()
    let loginButton = UIButton()
    var mainStackView = UIStackView()
    let titleLoginLabel = UILabel()
    let mainContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //MARK: - Фоновое изображение и тайтл
        setupBackgroundImage()
        setupTitleLabel()

    //MARK: - StackView
        let loginStackView = createInputStackView(title: "Введите логин", placeholder: "Логин")
        let passwordStackView = createInputStackView(title: "Введите пароль", placeholder: "Пароль")
        mainStackView = UIStackView (arrangedSubviews:  [titleLoginLabel, loginStackView, passwordStackView, loginButton])
        
        //MARK: - Настройки StackView и Label
        configureMainStackView()
        configureTitleLoginLabel()
        configureLoginButton ()
        
        //MARK: - mainContainerView
        configureMainControllerView()
        
    }
    //MARK: - методы
    private func setupTitleLabel() {
        titleLogoLabel.text = "Music Box"
        titleLogoLabel.font = UIFont(name: "Knewave-Regular", size: 36)
        titleLogoLabel.textColor = UIColor.white
        titleLogoLabel.textAlignment = .center
        view.addSubview(titleLogoLabel)
        
        titleLogoLabel.snp.makeConstraints { make in
            make.width.equalTo(295)
            make.height.equalTo(43)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
    }
    
    private func setupBackgroundImage () {
        backgroundImageView.image = UIImage(named: "backgroundUser")
        backgroundImageView.contentMode = .scaleToFill
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureMainControllerView () {
        view.addSubview(mainContainerView)
        mainContainerView.backgroundColor = UIColor.white
        mainContainerView.layer.cornerRadius = 15
        
        mainContainerView.snp.makeConstraints { make in
            make.width.equalTo(415)
            make.height.equalTo(400)
            make.leading.trailing.equalToSuperview().inset(35)
            make.top.equalTo(titleLogoLabel.snp.bottom).offset(70)
        }
    }
    
    private func createInputStackView (title : String, placeholder : String) -> UIStackView {
        //MARK: - настройка titleLabel и textField
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.black
        
        let textField = UITextField()
        textField.text = placeholder
        textField.backgroundColor = UIColor(red: 217/256, green: 217/256, blue: 217/256, alpha: 1)
        textField.layer.cornerRadius = 5
        textField.font = UIFont.systemFont(ofSize: 12)
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(47)
        }
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        stackView.axis = .vertical
        stackView.spacing = 1
        return stackView
    }
    
    private func configureMainStackView () {
        mainContainerView.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.spacing = 35
        mainStackView.distribution = .equalSpacing
        
//        mainStackView.backgroundColor = UIColor.green
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(40)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(55)
        }
        
        titleLoginLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.width.equalTo(159)
            make.height.equalTo(24)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureTitleLoginLabel () {
        titleLoginLabel.text = "Вход в аккаунт"
        titleLoginLabel.textAlignment = .center
        titleLoginLabel.textColor = UIColor.black
        titleLoginLabel.font = UIFont.systemFont(ofSize: 24)
    }
    
    private func configureLoginButton () {
        loginButton.setTitle("ВОЙТИ", for: .normal)
        loginButton.backgroundColor = UIColor(red: 131/256, green: 229/256, blue: 224.256, alpha: 1)
        loginButton.layer.cornerRadius = 15
        loginButton.setTitleColor(UIColor.black, for: .normal)
        
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(292)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
    }
}
