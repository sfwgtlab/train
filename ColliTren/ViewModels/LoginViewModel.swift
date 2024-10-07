//
//  LoginViewModel.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 16/08/24.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var loginResponse: LoginResponse?
    @Published var user: String = ""
    @Published var pass: String = ""
    @Published var loading: Bool = false
    @Published var message: String = ""
    @Published var alertTitle: String = ""
    @Published var alert: Bool = false
    @Published var goToHome: Bool = false
    
    
    func login(){
        loading = true
        LoginService.shared.login(user: user, pass: pass){ result in
            DispatchQueue.main.async { [self] in
                loading = false
                self.loginResponse = result
                self.message = result.message!
                if(result.code == 200){
                    self.alert = true
                    self.alertTitle = "OOPS"
                    
                }else{
                    self.goToHome = true
                }
            }
        }
    }
    
    func validateFields(){
        if(user.isEmpty || pass.isEmpty){
            message = "Campos incomplentos. Intentalo nuevamente."
            alert = true
        }else{
            login()
        }
    }
    
}
