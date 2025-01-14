//
//  RecoveryPass.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 26/05/24.
//

import SwiftUI

struct RecoveryPass: View {
    @StateObject var recoveryVM: RecoveryPassViewModel = RecoveryPassViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.blank)
                Image(.back)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                VStack{
                    VStack{
                        Text("OLVIDASTE TU CONTRASEÑA")
                            .font(Font.custom("Montserrat-Black", size: 20))
                            
                        VStack{
                            Image(.logoblack)
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.25)
                    }
                    .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.1)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0)
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.15)
                    
                    HStack{
                        TextField("Usuario", text: $recoveryVM.email)
                            .textInputAutocapitalization(.never)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 0.5)
                            .padding(-15)
                           
                    )
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.075)
                    
                    VStack{
                        
                        Button{
                            Task{
                                recoveryVM.validateField()
                            }
                        }
                        
                        label: {
                            HStack{
                                Text("Aceptar")
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.55, height: 40)
                            .foregroundColor(.white)
                            .font(Font.custom("Montserrat-Regular", size: 17))
                            .padding(10)
                            .padding(.horizontal)
                            .background(.first)
                            .cornerRadius(20)
                        }
                    }
                    
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                    
                    VStack{
                       
                        Button{
                            GoBack(presentationMode: self.presentationMode).goBack()
                        }
                        label: {
                            HStack{
                                Text("Cancelar")
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.55, height: 40)
                            .foregroundColor(.white)
                            .font(Font.custom("Montserrat-Regular", size: 17))
                            .padding(10)
                            .padding(.horizontal)
                            .background(.second)
                            .cornerRadius(20)
                        }
                    }
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.05)
                    
                }
            }
           
        }
        .navigationBarBackButtonHidden()
        .alert(isPresented: $recoveryVM.alert, content: {
            AlertView(title: recoveryVM.alertTitle, message: recoveryVM.alertMessage).showAlert()
        })
        
    }
}

#Preview {
    RecoveryPass()
}
