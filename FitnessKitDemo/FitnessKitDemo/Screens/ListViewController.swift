//
//  ListViewController.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
	
	let provider: ListProviderProtocol = ListProvider()
	
	// MARK: View lifecycle
	
	override func loadView() {
		let view = ListView(frame: UIScreen.main.bounds)
		self.view = view
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
