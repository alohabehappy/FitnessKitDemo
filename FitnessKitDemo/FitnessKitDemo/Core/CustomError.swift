//
//  CustomError.swift
//  FitnessKitDemo
//
//  Created by Vadim on 11/12/2018.
//  Copyright © 2018 AlohaBeHappy. All rights reserved.
//

import Foundation

public enum CustomError: Error, LocalizedError {
	case unknown
	
	public var localizedDescription: String {
		switch self {
		case .unknown:
			return "Unknown error"
		}
	}
}
