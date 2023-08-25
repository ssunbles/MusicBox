//
//  LyricSongSectionCell.swift
//  MusicBox
//
//  Created by Айнур on 13.08.2023.
// new code


import UIKit

class LyricSongSection : UITableViewCell {
    let containerView = UIView()
    let titleLyricLabel = UILabel()
    let textOfLyricLabel = UILabel()
    let initialMaxLines = 5
    var isExpanded = false
    var expandButton: UIButton!
    
    var songLyrics: String?
    var cellHeight: CGFloat = UITableView.automaticDimension
    
    var expandButtonAction: (() -> Void)?

    override init (style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        containerView.translatesAutoresizingMaskIntoConstraints = false
       // containerView.backgroundColor = UIColor(red: 208/255, green: 250/255, blue: 62/255, alpha: 1)
        contentView.addSubview(containerView)
        containerView.addSubview(titleLyricLabel)
        containerView.addSubview(textOfLyricLabel)
           
        titleLyricLabel.text = "Текст песни:"
        titleLyricLabel.textColor = UIColor.brown
        titleLyricLabel.translatesAutoresizingMaskIntoConstraints = false
        textOfLyricLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            titleLyricLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLyricLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLyricLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLyricLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            textOfLyricLabel.topAnchor.constraint(equalTo: titleLyricLabel.bottomAnchor, constant: 10),
            textOfLyricLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            textOfLyricLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textOfLyricLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            
        ])
        
        
        
        
        // Создание кнопки и добавление действия
        expandButton = UIButton(type: .system)
        expandButton.setTitle("Развернуть", for: .normal)
        expandButton.addTarget(self, action: #selector(toggleExpand), for: .touchUpInside)
        containerView.addSubview(expandButton)
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        
        expandButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.trailing.equalToSuperview().inset(1)
        }
    }
    
    @objc func toggleExpand (){ // переключается на развернуть
        isExpanded.toggle()
        if isExpanded {
            textOfLyricLabel.numberOfLines = 0
            expandButton.setTitle("Свернуть", for: .normal)
            textOfLyricLabel.text = songLyrics
        } else
        {
            let lines = songLyrics?.components(separatedBy: "\n") ?? []
            let truncatedLyrics = lines.prefix(initialMaxLines).joined(separator: "\n")
            textOfLyricLabel.text = truncatedLyrics
            expandButton.setTitle("Развернуть", for: .normal)
        }
        expandButtonAction?()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure (with lyrics: String) {
        isExpanded = false
        let lines  = lyrics.components(separatedBy: "\n")
        let truncatedLyrics = lines.prefix(initialMaxLines).joined(separator: "\n")
        textOfLyricLabel.text = truncatedLyrics
        songLyrics = lyrics
        textOfLyricLabel.numberOfLines = 0
        textOfLyricLabel.font = UIFont.systemFont(ofSize: 15)
    }
}
