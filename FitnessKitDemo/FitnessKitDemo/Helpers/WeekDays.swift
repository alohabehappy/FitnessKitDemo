//
//  WeekDays.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation

enum WeekDays: Int, CustomStringConvertible {
	case monday = 1
	case tuesday = 2
	case wednesday = 3
	case thursday = 4
	case friday = 5
	case saturday = 6
	case sunday = 7
	
	var description: String {
		switch self {
		case .monday:
			return "Monday"
		case .tuesday:
			return "Tuesday"
		case .wednesday:
			return "Wednesday"
		case .thursday:
			return "Thursday"
		case .friday:
			return "Friday"
		case .saturday:
			return "Saturday"
		case .sunday:
			return "Sunday"
		}
	}
}
