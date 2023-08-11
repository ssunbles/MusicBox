//
//  WhatToListenController.swift
//  MusicBox
//
//  Created by Айнур on 04.07.2023.
//

import UIKit

class WhatToListenController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Что послушать?"
        
        //MARK: - возврат на главную страницу
        
        let backButton = UIButton(type: .system)
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
