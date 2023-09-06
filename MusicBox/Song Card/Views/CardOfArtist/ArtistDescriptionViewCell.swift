//
//  ArtistDescriptionViewCell.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class ArtistDescriptionViewCell: UITableViewCell {
    //MARK: - Свойства
    let containerView = UIView()
    let titleDescriptionLabel = UILabel()
    let textOfDescriptionLabel = UILabel()
    let initialMaxLines = 5
    var isExpanded = false
    var expandButton : UIButton!
    
    var artistDescription : String?
    var cellHeight : CGFloat = UITableView.automaticDimension
    
    var expandButtonAction : (() -> Void)?
    
    //MARK: - метод
    func configure (with description : String) {
        isExpanded = false
        let lines = description.components(separatedBy: "\n")
        let truncatedDescription = lines.prefix(initialMaxLines).joined(separator: "\n")
        textOfDescriptionLabel.text = truncatedDescription
        artistDescription = description
        textOfDescriptionLabel.numberOfLines = initialMaxLines
        textOfDescriptionLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //MARK: - Контейнер
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        //MARK: - Главная кнопка
        titleDescriptionLabel.text = "Об исполнителе:"
        titleDescriptionLabel.textColor = UIColor(red: 223/256, green: 219/256, blue: 219/256, alpha: 1)
        containerView.addSubview(titleDescriptionLabel)
        
        titleDescriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
            make.bottom.lessThanOrEqualToSuperview()
        }
        //MARK: - Текст песни
        containerView.addSubview(textOfDescriptionLabel)
        
        textOfDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleDescriptionLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.lessThanOrEqualToSuperview().inset(10)
        }
        //MARK: - Кнопка развернуть / свернуть
        expandButton = UIButton(type: .system)
        expandButton.backgroundColor = .white
        expandButton.setTitle("Развернуть", for: .normal)
        expandButton.addTarget(self, action: #selector(toggleExpand), for: .touchUpInside)
        containerView.addSubview(expandButton)
        expandButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(1)
        }
    }
    
    //MARK: - Метод
    @objc func toggleExpand() {
        isExpanded.toggle()
        if isExpanded {
            textOfDescriptionLabel.numberOfLines = 0
            expandButton.setTitle("Свернуть", for: .normal)
            textOfDescriptionLabel.text = artistDescription
        } else {
            textOfDescriptionLabel.numberOfLines = initialMaxLines
            expandButton.setTitle("Развернуть", for: .normal)
        }
        expandButtonAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
