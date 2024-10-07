//
//  SignUpViewModel.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 02/10/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var generalResponse: GeneralResponse?
    @Published var loading: Bool = false
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var confirmPass: String = ""
    @Published var message: String = ""
    @Published var alert: Bool = false
    @Published var alertTitle: String = ""
    @Published var showPass: Bool = false
    
    func signUp(){
        loading = true
        SignUpService.shared.signUp(name: name, lastName: lastName, email: email, password: pass){ result in
            DispatchQueue.main.async { [self] in
                loading = false
                self.generalResponse = result
                self.message = result.message!
                if(result.code != 100){
                    self.alertTitle = "OOPS"
                    
                }else{
                    self.alertTitle = "Excelente"
                    emptyFields()
                }
                self.alert = true
            }
        }
        
    }
    
    func emptyFields(){
        self.name = ""
        self.lastName = ""
        self.email = ""
        self.pass = ""
        self.confirmPass = ""
    }
    
    func validatePass(){
        if(pass != confirmPass){
            message = "Las contraseñas no coinciden. Intentalo nuevamente."
            alert = true
        }else{
            signUp()
        }
    }
    
    func validateFields(){
        if(name.isEmpty || lastName.isEmpty || pass.isEmpty || confirmPass.isEmpty || email.isEmpty){
            message = "Campos incomplentos. Intentalo nuevamente."
            alert = true
        }else{
            validatePass()
        }
    }
}
