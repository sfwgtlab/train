//
//  RecoveryPass.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 26/05/24.
//

import SwiftUI

struct RecoveryPass: View {
    @State var showAlert: Bool = false
    @State var title: String = "titulo"
    @State var message: String = "Ingresa aqui el mensaje"
    @State var user: String = ""
    
    var body: some View {
        ZStack{
            Color(.blank)
            Image(.back)
                .resizable()
                .scaledToFill()
            VStack{
                HStack{
                    TextField("Usuario", text: $user)
                        .textInputAutocapitalization(.never)
                }
                .frame(width: UIScreen.main.bounds.width * 0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 0.5)
                        .padding(-15)
                )
                Spacer().frame(height: UIScreen.main.bounds.height * 0.075)
                
                
            }
        }
        .alert(isPresented: $showAlert, content: {
            AlertView(title: title, message: message).ShowAlert()
        })
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    RecoveryPass()
}
