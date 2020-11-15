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
        let counterVC = window?.rootViewController as? ViewController
        let counterViewReactor = CounterViewReactor()
        counterVC?.reactor = counterViewReactor

        
        return true
	}
}

