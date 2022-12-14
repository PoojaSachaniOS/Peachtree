//
//  AppDelegate.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    class func instance() -> AppDelegate { return UIApplication.shared.delegate as! AppDelegate }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // -- Navigation Appearance---
        self.setUpNavigationAndTabBarAppearance()
        // -- Window Root---
        if #available(iOS 13.0, *) {
            // In iOS 13 setup is done in SceneDelegate
        } else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            self.window = window
        }
        for family in UIFont.familyNames {

            let sName: String = family as String
            print("family: \(sName)")
                    
            for name in UIFont.fontNames(forFamilyName: sName) {
                print("name: \(name as String)")
            }
        }
        return true
    }
    
    
    private func setUpNavigationAndTabBarAppearance() {
        if #available(iOS 15.0, *){
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = Colors.color_AppThemeBlack
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = UITabBar.appearance().standardAppearance
                    
        } else {
            UITabBar.appearance().barTintColor = UIColor.red
            UITabBar.appearance().unselectedItemTintColor = UIColor.green
            UITabBar.appearance().tintColor = UIColor.yellow
            UITabBar.appearance().shadowImage = UIImage()
            UITabBar.appearance().backgroundImage = UIImage()

        }
        
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    // MARK: - Making RootView Controller
    func makingRootFlow(_ strRoot: String) {
        if strRoot == Constants.AppRootFlow.kEnterHome {
            if let tabBar = StoryboardUtils.getHomeTabBar() as? HomeTabBarController {
                let nav = UINavigationController(rootViewController: tabBar)
                nav.isNavigationBarHidden = true
                window?.rootViewController = tabBar
            }
        } else if strRoot == Constants.AppRootFlow.kGetStarted {
            if let controller = StoryboardUtils.getGetStartedVC() as? GetStartedVC {
                let nav = UINavigationController(rootViewController: controller)
                window?.rootViewController = nav
            }
        }
        window?.makeKeyAndVisible()
        UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
    
    
}

