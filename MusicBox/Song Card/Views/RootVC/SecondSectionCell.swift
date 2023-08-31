//
//  SecondSectionCell.swift
//  MusicBox
//
//  Created by Айнур on 31.08.2023.
//

import UIKit


class SecondSectionCell: UITableViewCell {
    let button = UIButton(type: .system)
    weak var delegate: SecondSectionDelegate? // свойство делегата
    
    func configure(title: String, tag: Int) {
        backgroundColor = UIColor.blue
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.backgroundColor = UIColor.red
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.center = contentView.center
        contentView.addSubview(button)
        
        // метод для отображения нажатия кнопки
        button.addTarget(self, action: #selector(buttonIsPressed), for: .touchUpInside)
        button.tag = tag
    }
    
    @objc func buttonIsPressed() {
        delegate?.buttonPressed(withSongs: DataManager.songs, tag: button.tag)
    }
}


protocol SecondSectionDelegate: AnyObject { // протокол делегата
func buttonPressed(withSongs songs: [Song], tag: Int)
}
