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
	func getSchedule(completion: @escaping (ListProviderResult) -> Void)
}

enum ListProviderResult {
	case success(items: [WorkoutEntity])
	case failure(error: Error?)
}

struct ListProvider: ListProviderProtocol {
	let moya = MoyaProvider<FitnessKitApi>()
	
	func getSchedule(completion: @escaping (ListProviderResult) -> Void) {
		
		moya.request(.schedule) { (result) in
			switch result {
			case .success(let response):
				let decoder = JSONDecoder()
				if let items = try? decoder.decode([WorkoutEntity].self, from: response.data) {
					completion(.success(items: items))
				}
			case .failure(let error):
				completion(.failure(error: error))
			}
		}
	}
}
