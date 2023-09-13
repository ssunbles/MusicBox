//
//  StartViewController.swift
//  MusicBox
//
//  Created by Айнур on 09.09.2023.
//

import UIKit

class StartViewController: UIViewController {
    //MARK: - Свойства
    let backgroundImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Фоновое изображение и тайтлы
        setupBackgroundImage()
        setupTitleLabel()
        setupSubTitleLabel()
        setupButtons()
      
    }
    
    //MARK: - Методы
    private func setupBackgroundImage() {
        backgroundImageView.image = UIImage(named: "backgroundStart")
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.frame = CGRect(x: -706, y: -80, width: 1149, height: 1290)
        backgroundImageView.clipsToBounds = true
        view.addSubview(backgroundImageView)
    }
    
    private func setupTitleLabel () {
        titleLabel.text = "Music Box"
        titleLabel.font = UIFont(name: "Knewave-Regular", size: 36)
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
//        titleLabel.numberOfLines = 1
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.width.equalTo(295)
            make.height.equalTo(43)
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(69)
        }
    }
    
    private func setupSubTitleLabel () {
        subTitleLabel.text = """
        Без музыки жизнь была бы ошибкой
                                        - Фридрих Ницше
        """
        subTitleLabel.font = UIFont(name: "19413", size: 15)
        subTitleLabel.textColor = UIColor.white
        subTitleLabel.numberOfLines = 2

        view.addSubview(subTitleLabel)
        
        subTitleLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(35)
        }
    }

    private func setupButtons() {
        //MARK: - Контейнер для кнопок
        let containerFor1_2_3Buttons = UIView()
        //containerFor1_2_3Buttons.backgroundColor  = UIColor.blue
        view.addSubview(containerFor1_2_3Buttons)
        
        containerFor1_2_3Buttons.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(200)
            make.top.equalTo(subTitleLabel.snp.bottom).offset(340)
            make.leading.equalToSuperview().offset(20)
        }
        
        //MARK: - Кнопки
        let buttonTitles = ["Создать аккаунт", "У меня есть аккаунт", "Войти как гость"]
        let actions : [Selector] = [#selector(button1Tapped), #selector(button2Tapped), #selector(button3Tapped)]
        var buttons = [UIButton]()
        
        for(index, title) in buttonTitles.enumerated() {
            let button = UIButton()
            configureButton(button, title: title, action: actions[index])
            buttons.append(button)
        }
        
        //MARK: - Button1
        containerFor1_2_3Buttons.addSubview(buttons[0])
        
        buttons[0].snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        //MARK: - Button2
        containerFor1_2_3Buttons.addSubview(buttons[1])
        
        buttons[1].snp.makeConstraints { make in
            make.top.equalTo(buttons[0].snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(10)
        }
        
        //MARK: - Button3
        containerFor1_2_3Buttons.addSubview(buttons[2])
        
        buttons[2].snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    //MARK: - Методы
    private func configureButton (_ button : UIButton, title : String, action : Selector) {
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor.black, for: .normal) // цвет кнопки
        
        button.snp.makeConstraints { make in
            make.width.equalTo(230)
            make.height.equalTo(50)
        }
        
        view.addSubview(button)
    }
    @objc func button1Tapped () {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc func button2Tapped () {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    @objc func button3Tapped () {
        let guestVC = ViewController()
        navigationController?.pushViewController(guestVC, animated: true)
    }
}

