//
//  Environment.swift
//  Swift-CI-CD
//
//  Created by Sekny Yim on 24-11-2025.
//


import Foundation

/// Case-less enum used as a namespace.
public enum Environment {
	
	/// a enum to centralize all keys
	private enum Keys: String {
		case apiBaseUrl = "BASE_URL"
		case apiSecret = "CLIENT_SECRET"
		case envName = "ENV_NAME"
		case version = "MARKETING_VERSION"
		case buildNumber = "CURRENT_PROJECT_VERSION"
	}
	
	/// If cannot find Info.plist, simply crash as it is a developer error and should never happen
	private static let infoDictionary: [String: Any] = Bundle.main.infoDictionary ?? [:]
	
	static let apiBaseUrl: String = infoDictionary[Keys.apiBaseUrl.rawValue] as? String ?? ""
	static let apiSecret: String = infoDictionary[Keys.apiSecret.rawValue] as? String ?? ""
	static let version: String = infoDictionary[Keys.version.rawValue] as? String ?? ""
	static let buildNumber: String = infoDictionary[Keys.buildNumber.rawValue] as? String ?? ""
	static let envName: String = infoDictionary[Keys.envName.rawValue] as? String ?? ""
}
