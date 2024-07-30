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
                .frame(width: UIScreen.main.bounds.width * 1)
            VStack{
                if(loading){
                    VStack{
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(2)
                    }
                }else{
                    VStack{
                        VStack{
                            Text("REGISTRATE")
                                .font(Font.custom("Montserrat-Black", size: 20))
                            VStack{
                                Image(.logoblack)
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.25  )
                        }
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
