//
//  WorkoutListCell.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import UIKit
import SnapKit

class WorkoutListCell: UITableViewCell {
	
	func configure(with viewModel: WorkoutViewModel?) {
		startTimeLabel.text = viewModel?.startTime ?? ""
		endTimeLabel.text = viewModel?.endTime ?? ""
		titleLabel.text = viewModel?.title ?? ""
		teacherLabel.text = viewModel?.teacher ?? ""
	}
	
	// MARK: - UI properties
	
	private lazy var startTimeLabel: UILabel = UILabel()
	private lazy var endTimeLabel: UILabel = UILabel()
	
	private lazy var titleLabel: UILabel = {
		let view = UILabel()
		view.numberOfLines = 0
		view.textAlignment = .left
		return view
	}()
	
	private lazy var teacherLabel: UILabel = {
		let view = UILabel()
		view.numberOfLines = 0
		view.textAlignment = .left
		return view
	}()
	
	// MARK: - Init
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Configure Views
	
	private func configureViews() {
		addSubview(startTimeLabel)
		addSubview(endTimeLabel)
		addSubview(titleLabel)
		addSubview(teacherLabel)
		
		startTimeLabel.snp.makeConstraints { (make) in
			make.left.top.equalToSuperview().offset(8)
		}
		
		endTimeLabel.snp.makeConstraints { (make) in
			make.left.equalTo(startTimeLabel.snp.left)
			make.top.equalTo(startTimeLabel.snp.bottom).offset(4)
		}
		
		titleLabel.snp.makeConstraints { (make) in
			make.left.equalTo(startTimeLabel.snp.right).offset(16)
			make.top.equalTo(startTimeLabel.snp.top)
		}
		
		teacherLabel.snp.makeConstraints { (make) in
			make.left.equalTo(titleLabel.snp.left)
			make.top.equalTo(titleLabel.snp.bottom).offset(4)
			make.bottom.equalToSuperview().offset(-8)
		}
	}
}
