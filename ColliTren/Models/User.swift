//
//  User.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 20/09/24.
//

import Foundation

struct User: Codable {
    let userId: Int
    let userName: String
    let lastname: String
    let email: String
    let phoneNumber: String
    let cardToken: String
}
