//
//  WorkoutEntity.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation

class WorkoutEntity: Decodable {
	var appointmentId: String
	var title: String
	var description: String
	var place: String
	var teacher: String
	var startTime: String
	var endTime: String
	var weekDay: Int
	
	// MARK: - Decodable
	
	enum CodingKeys: String, CodingKey {
		case appointmentId = "appointment_id"
		case title = "name"
		case description
		case place
		case teacher
		case startTime
		case endTime
		case weekDay
	}
	
	required init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		appointmentId = try values.decode(String.self, forKey: .appointmentId)
		title = try values.decode(String.self, forKey: .title)
		description = try values.decode(String.self, forKey: .description)
		place = try values.decode(String.self, forKey: .place)
		teacher = try values.decode(String.self, forKey: .teacher)
		startTime = try values.decode(String.self, forKey: .startTime)
		endTime = try values.decode(String.self, forKey: .endTime)
		weekDay = try values.decode(Int.self, forKey: .weekDay)
	}
}
