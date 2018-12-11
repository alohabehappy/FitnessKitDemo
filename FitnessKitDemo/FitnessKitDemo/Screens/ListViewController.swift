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
		loadSchedule()
	}
	
	// MARK: - Private
	
	private func loadSchedule() {
		provider.getSchedule { [weak self] (result) in
			switch result {
			case .success(let items):
				print(items)
			case .failure(let error):
				self?.showErrorMessage(error?.localizedDescription)
			}
		}
	}
	
	private func showErrorMessage(_ message: String?) {
		let alert = AlertHelper.alert(title: "Error",
									  message: message,
									  controller: self,
									  buttons: nil,
									  completion: nil)
		present(alert, animated: true, completion: nil)
	}
}
