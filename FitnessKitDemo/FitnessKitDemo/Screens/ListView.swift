//
//  ListView.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import UIKit

extension ListView {
	struct Appearance {
	}
}

class ListView: UIView {
	
	override init(frame: CGRect = CGRect.zero) {
		super.init(frame: frame)
		configureViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureViews() {
	}
}
