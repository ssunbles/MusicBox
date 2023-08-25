//
//  ReusableCellProtocol.swift
//  MusicBox
//
//  Created by Айнур on 25.08.2023.
//

import Foundation
import UIKit

protocol ReusableCellProtocol {
    static var identifier : String { get }
    static var nib : UINib { get }
}

extension ReusableCellProtocol {
    static var identifier : String {
    String(describing: self)
    }
    
    static var nib : UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

extension UITableViewCell : ReusableCellProtocol {}
extension UICollectionView : ReusableCellProtocol {}
