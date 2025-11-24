//
//  ViewController.swift
//  Swift-CI-CD
//
//  Created by Sekny Yim on 21-11-2025.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		testLoad()
	}
	
	private func testLoad() {
		let url = "https://jsonplaceholder.typicode.com/users"
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
}


struct User: Decodable {
	let id: Int
	let name: String
	let email: String
}
