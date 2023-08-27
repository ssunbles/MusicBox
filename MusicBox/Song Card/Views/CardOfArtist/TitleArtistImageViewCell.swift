//
//  TitleArtistImageView.swift
//  MusicBox
//
//  Created by Айнур on 26.08.2023.
//

import UIKit

class TitleArtistImageViewCell: UITableViewCell {
    let artistImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        artistImageView.contentMode = .scaleAspectFit
        artistImageView.clipsToBounds  = true
        contentView.addSubview(artistImageView)
        artistImageView.translatesAutoresizingMaskIntoConstraints = false
        artistImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
            make.height.equalTo(280)
        }
    }
    
    
}
