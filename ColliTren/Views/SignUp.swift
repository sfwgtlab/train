//
//  SignUp.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 26/05/24.
//

import SwiftUI

struct SignUp: View {
    var loading: Bool = false
    var name: String = ""
    var pass: String = ""
    var email: String = ""
    var body: some View {
        ZStack{
            Color(.blank)
            Image(.back)
                .resizable()
                .scaledToFill()
            VStack{
                if(loading){
                    VStack{
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(2)
                    }
                }else{
                    VStack{
                        
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SignUp()
}
