//
//  AppDelegate.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		logDocumentDirectory()
		loadRootViewController()
		
		return true
	}
	
	private func logDocumentDirectory() {
		guard let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
		print(documentsUrl)
	}
	
	private func loadRootViewController() {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.backgroundColor = .white
		window?.makeKeyAndVisible()
		let navController = UINavigationController(rootViewController: ListViewController())
		window?.rootViewController = navController
	}
}
