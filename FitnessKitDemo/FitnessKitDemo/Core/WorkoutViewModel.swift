//
//  WorkoutViewModel.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation

struct WorkoutViewModel {
	var title: String
	var text: String
	var place: String
	var teacher: String
	var startTime: String
	var endTime: String
	var weekDay: Int
	
	init(entity: WorkoutEntity) {
		self.title = entity.title
		self.text = entity.text
		self.place = entity.place
		self.teacher = entity.teacher
		self.startTime = entity.startTime
		self.endTime = entity.endTime
		self.weekDay = entity.weekDay
	}
}
