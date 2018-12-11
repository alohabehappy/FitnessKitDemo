//
//  ListView.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import UIKit
import SnapKit

extension ListView {
	struct Appearance {
	}
}

class ListView: UIView {
	
	// MARK: - UI properties
	
	lazy var tableView: UITableView = {
		let view = UITableView()
		view.backgroundColor = .clear
		return view
	}()
	
	// MARK: - Init
	
	override init(frame: CGRect = CGRect.zero) {
		super.init(frame: frame)
		configureViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureViews() {
		addSubview(tableView)
		
		tableView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
	}
}
