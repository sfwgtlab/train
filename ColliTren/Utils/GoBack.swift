//
//  GoBack.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 09/06/24.
//

import Foundation
import SwiftUI

class GoBack{
    var presentationMode: Binding<PresentationMode>
        
    init(presentationMode: Binding<PresentationMode>) {
        self.presentationMode = presentationMode
    }
        
    func goBack(){
        self.presentationMode.wrappedValue.dismiss()
    }
    
}
