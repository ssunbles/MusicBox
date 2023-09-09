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
        titleLabel.numberOfLines = 1
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

    
    
    
}
