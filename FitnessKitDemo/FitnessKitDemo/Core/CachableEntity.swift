//
//  CachableEntity.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CachableEntity: Object, Decodable {
	
	// MARK: - Init
	
	required init() {
		super.init()
	}
	
	required init(realm: RLMRealm, schema: RLMObjectSchema) {
		super.init(realm: realm, schema: schema)
	}
	
	required init(value: Any, schema: RLMSchema) {
		super.init(value: value, schema: schema)
	}
	
	// MARK: - Decodable
	
	required init(from decoder: Decoder) throws {
		super.init()
		try decode(from: decoder)
	}
	
	func decode(from decoder: Decoder) throws {
		// override in subclasses
	}
}
