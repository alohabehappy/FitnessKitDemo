//
//  Cache.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation
import RealmSwift

class Cache {
	let realm = try! Realm()
	
	func get<T: CachableEntity>(_ type: T.Type, sortKeyPath: String? = nil, ascending: Bool = true) -> [T] {
		var objects = realm.objects(T.self)
		
		if let keyPath = sortKeyPath {
			objects = objects.sorted(byKeyPath: keyPath, ascending: ascending)
		}
		
		return Array(objects)
	}
	
	func save(items: [CachableEntity]) throws {
		do {
			try realm.write {
				realm.add(items, update: true)
			}
		} catch {
			throw error
		}
	}
	
	func delete<T: CachableEntity>(_ type: T.Type) throws {
		let objects = realm.objects(T.self)
		
		do {
			try realm.write {
				realm.delete(objects)
			}
		} catch {
			throw error
		}
	}
}
