//
//  SceneDelegate.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private(set) static var shared: SceneDelegate?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        Self.shared = self
        self.makingRootFlow(Constants.AppRootFlow.kGetStarted)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
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

