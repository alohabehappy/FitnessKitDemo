//
//  ListProvider.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation

protocol ListProviderProtocol {
}

enum ListProviderResult {
	case success()
	case failure(error: Error?)
}

struct ListProvider: ListProviderProtocol {
	
}
