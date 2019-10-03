//
//  User.swift
//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 02/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

struct User: Decodable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}

struct UserRoot : Decodable {
   let userAccount: User
}
