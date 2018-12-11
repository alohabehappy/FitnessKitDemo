//
//  ListProvider.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation
import Moya

protocol ListProviderProtocol {
	func getCachedSchedule(completion: @escaping (ListProviderResult) -> Void)
	func getOnlineSchedule(completion: @escaping (ListProviderResult) -> Void)
}

enum ListProviderResult {
	case success(items: [WorkoutEntity])
	case failure(error: Error?)
}

class ListProvider: ListProviderProtocol {
	let moya = MoyaProvider<FitnessKitApi>()
	let cache = Cache()
	
	func getCachedSchedule(completion: @escaping (ListProviderResult) -> Void) {
		let items = cache.get(WorkoutEntity.self)
		completion(.success(items: items))
	}
	
	func getOnlineSchedule(completion: @escaping (ListProviderResult) -> Void) {
		moya.request(.schedule) { [weak self] (result) in
			switch result {
			case .success(let response):
				guard let items = try? JSONDecoder().decode([WorkoutEntity].self, from: response.data) else {
					completion(.failure(error: CustomError.unknown))
					return
				}
				do {
					try self?.cache.delete(WorkoutEntity.self)
					try self?.cache.save(items: items)
				}
				catch {
					completion(.failure(error: error))
					return
				}
				completion(.success(items: items))
			case .failure(let error):
				completion(.failure(error: error))
			}
		}
	}
}
