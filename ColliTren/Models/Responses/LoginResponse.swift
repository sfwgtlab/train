//
//  LoginResponse.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 20/09/24.
//

import Foundation

struct LoginResponse: Decodable {
    let message: String?
    let codigo: Int
    let data: User?
}
