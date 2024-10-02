//
//  AlertView.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 09/06/24.
//

import Foundation
import SwiftUI


class AlertView{
    
    var title: String
    var message: String
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    func showAlert() -> Alert{
        return Alert(
            title: Text(title),
            message: Text(message),
            dismissButton: .cancel(Text("OK"))
        )
    }
}
