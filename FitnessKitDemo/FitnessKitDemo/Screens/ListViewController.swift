//
//  ListViewController.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import UIKit
import MBProgressHUD

class ListViewController: UIViewController {
	
	let provider: ListProviderProtocol = ListProvider()
	
	// MARK: View lifecycle
	
	override func loadView() {
		let view = ListView(frame: UIScreen.main.bounds)
		self.view = view
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupNavBar()
		loadSchedule()
	}
	
	// MARK: - Private
	
	private func loadSchedule() {
		provider.getCachedSchedule { [weak self] (result) in
			switch result {
			case .success(let items):
				print(items)
			case .failure(let error):
				self?.showErrorMessage(error?.localizedDescription)
			}
		}
	}
	
	private func reloadSchedule() {
		showProgress(true)
		
		provider.getOnlineSchedule { [weak self] (result) in
			self?.showProgress(false)
			
			switch result {
			case .success(let items):
				print(items)
			case .failure(let error):
				self?.showErrorMessage(error?.localizedDescription)
			}
		}
	}
	
	private func showErrorMessage(_ message: String?) {
		let alert = AlertHelper.alert(title: "Error", message: message, controller: self)
		present(alert, animated: true, completion: nil)
	}
	
	private func showProgress(_ shouldShow: Bool) {
		if shouldShow {
			MBProgressHUD.showAdded(to: view, animated: true)
		}
		else {
			MBProgressHUD.hide(for: view, animated: true)
		}
	}
	
	private func setupNavBar() {
		title = "Schedule"
		
		let button = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTapped))
		navigationItem.leftBarButtonItem = button
	}
	
	@objc private func refreshTapped() {
		reloadSchedule()
	}
}
