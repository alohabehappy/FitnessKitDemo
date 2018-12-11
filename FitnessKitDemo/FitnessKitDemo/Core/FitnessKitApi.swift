//
//  FitnessKitApi.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation
import Moya

enum FitnessKitApi {
	case schedule
}

// MARK: - TargetType

extension FitnessKitApi: TargetType {
	var baseURL: URL {
		return URL(string: "https://sample.fitnesskit-admin.ru")!
	}
	
	var path: String {
		switch self {
		case .schedule:
			return "/schedule/get_group_lessons_v2/4/"
		}
	}
	
	var method: Moya.Method {
		return .get
	}
	
	var sampleData: Data {
		return Data()
	}
	
	var task: Moya.Task {
		return .requestPlain
	}
	
	var headers: [String : String]? {
		return nil
	}
}
