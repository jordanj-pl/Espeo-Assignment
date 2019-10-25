//
//  AppDelegate.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	public var window: UIWindow?
	public let mainRouter = MainRouter()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let rootVC = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()

		guard let rootViewController = rootVC else {
			return false
		}

		let nc = UINavigationController(rootViewController: rootViewController)

		window = UIWindow(frame: UIScreen.main.bounds)

		guard let w = window else {
			return false
		}

		w.rootViewController = nc
		w.makeKeyAndVisible()

		mainRouter.navController = nc
		mainRouter.startMainFlow()

		return true
	}

}

