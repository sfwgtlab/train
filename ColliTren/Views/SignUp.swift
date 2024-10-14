//
//  SignUp.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 26/05/24.
//

import SwiftUI

struct SignUp: View {
    @State var loading: Bool = false
    @StateObject var signUpVM: SignUpViewModel = SignUpViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ScrollView{
            ZStack{
                Color(.blank)
                Image(.back)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
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
                                Spacer().frame(height: UIScreen.main.bounds.height * 0.065)
                                Text("REGISTRATE")
                                    .font(Font.custom("Montserrat-Black", size: 20))
                                VStack{
                                    Image(.logoblack)
                                        .resizable()
                                        .scaledToFit()
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.25 )
                                Spacer().frame(height: UIScreen.main.bounds.height * 0.065)
                                VStack{
                                    HStack{
                                        TextField("Nombre(s)", text: $signUpVM.name)
                                            .textInputAutocapitalization(.never)
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 0.5)
                                            .padding(-15)
                                    )
                                    Spacer().frame(height: UIScreen.main.bounds.height * 0.065)
                                    HStack{
                                        TextField("Apellidos", text: $signUpVM.lastName)
                                            .textInputAutocapitalization(.never)
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 0.5)
                                            .padding(-15)
                                    )
                                    Spacer().frame(height: UIScreen.main.bounds.height * 0.065)
                                    HStack{
                                        TextField("Correo electrónico", text: $signUpVM.email)
                                            .textInputAutocapitalization(.never)
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 0.5)
                                            .padding(-15)
                                    )
                                    
                                    Spacer().frame(height: UIScreen.main.bounds.height * 0.065)
                                    HStack{
                                        !signUpVM.showPass ?
                                        AnyView(SecureField("Contraseña", text: $signUpVM.pass))
                                        :
                                        AnyView( TextField("Contraseña", text: $signUpVM.pass)
                                            .textInputAutocapitalization(.never))
                                        Button{
                                            Task{
                                                signUpVM.showPass.toggle()
                                            }
                                            
                                        }label: {
                                            Image(systemName: signUpVM.showPass ? "eye.slash.fill" : "eye.fill")
                                                .padding(.horizontal, 2)
                                                .foregroundColor(.first)
                                        }
                                        
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 0.5)
                                            .padding(signUpVM.showPass ? -15 : -14.7)
                                    )
                                    Spacer().frame(height: UIScreen.main.bounds.height * 0.065)
                                    HStack{
                                        !signUpVM.showPass ?
                                        AnyView(SecureField("Confirmar contraseña", text: $signUpVM.confirmPass))
                                        :
                                        AnyView( TextField("Confirmar contraseña", text: $signUpVM.confirmPass  )
                                            .textInputAutocapitalization(.never))
                                        Button{
                                            Task{
                                                signUpVM.showPass.toggle()
                                            }
                                            
                                        }label: {
                                            Image(systemName: signUpVM.showPass ? "eye.slash.fill" : "eye.fill")
                                                .padding(.horizontal, 2)
                                                .foregroundColor(.first)
                                        }
                                        
                                    }
                                    .frame(width: UIScreen.main.bounds.width * 0.8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.black, lineWidth: 0.5)
                                            .padding(signUpVM.showPass ? -15 : -14.7)
                                    )
                                }
                                Spacer().frame(height: UIScreen.main.bounds.height * 0.08)
                                
                                VStack{
                                   
                                    Button{
                                        Task{
                                            signUpVM.validateFields()
                                        }
                                    }
                                    
                                    label: {
                                        HStack{
                                            Text("Siguiente")
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
                                Spacer().frame(height: UIScreen.main.bounds.height * 0.1)
                            }
                        }
                    }
                }
            }
            
        }
        .padding(.vertical, 1)
        .alert(isPresented: $signUpVM.alert, content: {
            AlertView(title: signUpVM.alertTitle, message: signUpVM.message).showAlert()
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SignUp()
}
