//
//  Statement.swift
//  TesteiOS
//
//  Created by Gustavo Garcia Leite on 02/10/19.
//  Copyright © 2019 Gustavo Garcia Leite. All rights reserved.
//

struct Statement: Decodable {
    let title: String
    let desc: String
    let date: String
    let value: Double
}

struct StatementRoot : Decodable {
   let statementList: [Statement]
}
