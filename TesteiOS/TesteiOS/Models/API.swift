//
//  API.swift
//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 02/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//
import Alamofire

enum API: String {
    case loginURL = "https://bank-app-test.herokuapp.com/api/login"
    case statementsURL = "https://bank-app-test.herokuapp.com/api/statements/1"
    
    func post(user: String, password: String, success: @escaping (_ response : Data) -> (), failure: @escaping (_ error : Error) -> ()) {
        let url = self.rawValue
        let parameters: [String : Any] = ["user": user, "password": password]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func get(success: @escaping (_ response : Data) -> (), failure: @escaping (_ error : Error) -> ()) {
        let url = self.rawValue
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                success(data)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
