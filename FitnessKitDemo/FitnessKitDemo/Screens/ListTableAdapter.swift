//
//  ListTableAdapter.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import UIKit

class ListTableAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
	
	private var items: [WorkoutViewModel] = [] {
		didSet {
			groupedItems = [:]
			guard items.count > 0 else { return }
			
			for weekDay in WeekDays.monday.rawValue...WeekDays.sunday.rawValue {
				groupedItems[weekDay] = items.filter { $0.weekDay == weekDay }
			}
		}
	}
	private var groupedItems: [Int: [WorkoutViewModel]] = [:]
	private var tableView: UITableView?
	
	// MARK: - Public
	
	func connect(tableView: UITableView, items: [WorkoutViewModel]) {
		self.tableView = tableView
		tableView.dataSource = self
		tableView.delegate = self
		tableView.rowHeight = UITableView.automaticDimension
		self.items = items
		
		tableView.register(WorkoutListCell.self, forCellReuseIdentifier: WorkoutListCell.identifier)
		tableView.reloadData()
	}
	
	func reload(with items: [WorkoutViewModel]) {
		self.items = items
		tableView?.reloadData()
	}
	
	// MARK: - UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return groupedItems.keys.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return groupedItems[section]?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if let weekday = WeekDays(rawValue: section + 1) {
			return weekday.description
		}
		return nil
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: WorkoutListCell.identifier, for: indexPath) as! WorkoutListCell
		
		let item = groupedItems[indexPath.section]?[indexPath.row]
		cell.configure(with: item)
		
		return cell
	}
	
	// MARK: - UITableViewDelegate

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(indexPath.row)
	}
}

