//
//  OtherArtistsCollectionView.swift
//  MusicBox
//
//  Created by Айнур on 07.09.2023.
//

import UIKit

class OtherArtistsCollectionView: UICollectionViewCell {
    let otherArtistTitleLabel = UILabel()
    let otherArtistImageLabel = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(otherArtistImageLabel)
        contentView.addSubview(otherArtistTitleLabel)
        
        otherArtistImageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(otherArtistTitleLabel.snp.top)
            make.height.equalTo(80)
        }
        otherArtistTitleLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(otherArtistImageLabel.snp.bottom)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
    
    func configure (with artist : Artist) {
        otherArtistTitleLabel.text = artist.artistName ?? "Unknown Artist"
        otherArtistTitleLabel.font = UIFont.systemFont(ofSize: 10)
        otherArtistTitleLabel.textAlignment = .center
        
        if let artistImage = artist.artistImage {
            otherArtistImageLabel.image = artistImage
        } else {
            otherArtistImageLabel.image = UIImage ( named: "default Image")
        }
    }
}
