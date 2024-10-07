//
//  GeneralResponse.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 02/10/24.
//

import Foundation

struct GeneralResponse: Decodable {
    let message: String?
    let code: Int
}
