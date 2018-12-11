//
//  WorkoutEntity.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation

class WorkoutEntity: CachableEntity {
	@objc dynamic var appointmentId: String = ""
	@objc dynamic var title: String = ""
	@objc dynamic var text: String = ""
	@objc dynamic var place: String = ""
	@objc dynamic var teacher: String = ""
	@objc dynamic var startTime: String = ""
	@objc dynamic var endTime: String = ""
	@objc dynamic var weekDay: Int = 0
	
	// MARK: - Override
	
	override static func primaryKey() -> String? {
		return "appointmentId"
	}
	
	// MARK: - Decodable
	
	enum CodingKeys: String, CodingKey {
		case appointmentId = "appointment_id"
		case title = "name"
		case text = "description"
		case place
		case teacher
		case startTime
		case endTime
		case weekDay
	}
	
	override func decode(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		appointmentId = try values.decode(String.self, forKey: .appointmentId)
		title = try values.decode(String.self, forKey: .title)
		text = try values.decode(String.self, forKey: .text)
		place = try values.decode(String.self, forKey: .place)
		teacher = try values.decode(String.self, forKey: .teacher)
		startTime = try values.decode(String.self, forKey: .startTime)
		endTime = try values.decode(String.self, forKey: .endTime)
		weekDay = try values.decode(Int.self, forKey: .weekDay)
	}
}
