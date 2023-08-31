//
//  FirstSectionCell.swift
//  MusicBox
//
//  Created by Айнур on 31.08.2023.
//

import UIKit

class FirstSectionCell: UITableViewCell {
    
    //MARK: - Свойства
    let roundButton = UIButton(type: .system)
    
    func configure() {
        backgroundColor = UIColor.red
        roundButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        roundButton.backgroundColor = UIColor.blue
        roundButton.layer.cornerRadius = roundButton.frame.size.width / 2
        roundButton.clipsToBounds = true
        roundButton.setTitle("Что послушать?", for: .normal)
        roundButton.setTitleColor(UIColor.white, for: .normal)
        roundButton.center = contentView.center
        contentView.addSubview(roundButton)
        NSLayoutConstraint.activate([
            roundButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roundButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            roundButton.widthAnchor.constraint(equalToConstant: 200),
            roundButton.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
