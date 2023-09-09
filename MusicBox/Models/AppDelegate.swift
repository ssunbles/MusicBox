//
//  AppDelegate.swift
//  MusicBox

//  Created by Айнур on 04.07.2023.
// new code


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var navigationController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool { // вызывается после запуска приложения
        self.window = UIWindow(frame: UIScreen.main.bounds) //создание экземпляра класс window и установка ему размеров равным размеру экрана устройства
        let viewController = ViewController() // создаем экземпляр класса
        let startViewController = StartViewController()
        
        self.navigationController = UINavigationController(rootViewController: startViewController) // вернуть на viewController
        self.window?.rootViewController = navigationController // устанавливаем навигейшен контроллер в качестве главного и видимого окна приложения
        self.window?.backgroundColor = UIColor.white //
        self.window?.makeKeyAndVisible()
        return true
    }
}

