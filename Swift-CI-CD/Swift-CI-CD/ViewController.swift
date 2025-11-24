//
//  ViewController.swift
//  Swift-CI-CD
//
//  Created by Sekny Yim on 21-11-2025.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
	
	@IBOutlet weak var lblVersion: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		requestAPI()
	}
	
	private func requestAPI() {
		let url = "\(Environment.apiBaseUrl)/users"
		AF.request(url, method: .get)
			.validate()
			.responseDecodable(of: [User].self) { response in
				switch response.result {
				case .success(let users):
					print("Users:", users)
				case .failure(let error):
					print("Request failed with error:", error)
				}
			}
	}
	
	private func setup() {
		lblVersion.text = "\(Environment.version) (\(Environment.buildNumber.uppercased()))"
	}
}


struct User: Decodable {
	let id: Int
	let name: String
	let email: String
}
