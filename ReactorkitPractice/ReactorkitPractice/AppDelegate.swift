//
//  AppDelegate.swift
//  ReactorkitPractice
//
//  Created by Lyine on 2020/11/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		makeRootViewController()
		return true
	}
}



extension AppDelegate {
	func makeRootViewController() {
		
		let reactor = ButtonReactor(service: ButtonAPI())
		let viewController = ButtonViewController(reactor: reactor)
		
		let window = { () -> UIWindow in
			let window = UIWindow(frame: UIScreen.main.bounds)
			window.rootViewController = viewController
			window.backgroundColor = .white
			return window
		}()
		
		self.window = window
		self.window?.makeKeyAndVisible()
	}
}

