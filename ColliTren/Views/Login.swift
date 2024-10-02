//
//  Login.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 24/05/24.
//

import SwiftUI

struct Login: View {
    
    @State var loading: Bool = false
    @State var user: String = ""
    @State var pass: String = ""
    @State var showPass: Bool = false
    @StateObject var loginVM: LoginViewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.blank)
                Image(.back)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                VStack{
                    
                    if loading {
                        VStack{
                            ProgressView()
                                .progressViewStyle(.circular)
                                .scaleEffect(2)
                        }
                    }else{
                        VStack{
                            Spacer().frame(height: UIScreen.main.bounds.height * 0.02)
                            VStack{
                                Image(.logoblack)
                                    .resizable()
                                    .scaledToFit()
                            }
                            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.3)
                            
                            
                            Spacer().frame(height: UIScreen.main.bounds.height * 0.075)
                            
                            VStack{
                                
                                HStack{
                                    TextField("Usuario", text: $loginVM.user)
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
                                    !showPass ?
                                    AnyView(SecureField("Contraseña", text: $loginVM.pass))
                                    :
                                    AnyView( TextField("Contraseña", text: $loginVM.pass)
                                        .textInputAutocapitalization(.never))
                                    Button{
                                        Task{
                                            showPass.toggle()
                                        }
                                        
                                    }label: {
                                        Image(systemName: showPass ? "eye.slash.fill" : "eye.fill")
                                            .padding(.horizontal, 2)
                                    }
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.black, lineWidth: 0.5)
                                        .padding(showPass ? -15 : -14.7)
                                )
                                
                                Spacer().frame(height: UIScreen.main.bounds.height * 0.08)
                                
                                VStack{
                                   
                                    Button{
                                        Task{
                                            loginVM.validateFields()
                                        }
                                    }
                                    
                                    label: {
                                        HStack{
                                            Text("Ingresar")
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
                            }
                            .foregroundColor(.black)
                            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.2)
                            
                            Spacer().frame(height: UIScreen.main.bounds.height * 0.065)
                            VStack{
                                
                                
                                NavigationLink{
                                    RecoveryPass()
                                }label: {
                                    Text("Olvidaste tu contraseña")
                                        .foregroundStyle(.black)
                                }
                                Text("o")
                                NavigationLink{
                                    SignUp()
                                   
                                }label: {
                                    Text("Crea una cuenta")
                                        .foregroundStyle(.black)
                                }
                                
                            }
                            .font(Font.custom("Montserrat-Regular", size: 17))
                            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.2)
                            
                        
                        }
                        
                        
                    }
                    
                }
                .zIndex(1)
                
            }
            .navigationDestination(isPresented: $loginVM.goToHome){
                Home()
            }
            
        }
        .alert(isPresented: $loginVM.alert, content: {
            AlertView(title: loginVM.alertTitle, message: loginVM.message).showAlert()
        })
        
    }
    
}

#Preview {
    Login()
}
