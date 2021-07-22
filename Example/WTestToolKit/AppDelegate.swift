//
//  AppDelegate.swift
//  WTestToolKit
//
//  Created by Jefferson Batista on 07/21/2021.
//

import WTestToolKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func applicationDidFinishLaunching(_ application: UIApplication) {
            let controller = RouterWTestToolKit.rootViewController()
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.setNavigationBarHidden(false, animated: false)
            navigationController.navigationBar.isTranslucent = true
            navigationController.navigationBar.tintColor = .gray
            if #available(iOS 11.0, *) {
                UINavigationBar.appearance().largeTitleTextAttributes =
                    [
                        NSAttributedString.Key.foregroundColor: UIColor.darkText,
                        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22),
                    ]
            }
            window?.rootViewController = navigationController
        }
}

