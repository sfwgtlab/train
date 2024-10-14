    //
//  RecoveryPassViewModel.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 06/10/24.
//

import Foundation
class RecoveryPassViewModel: ObservableObject{
    @Published var generalResponse: GeneralResponse?
    @Published var email: String = ""
    @Published var alert: Bool = false
    @Published var loading: Bool = false
    @Published var alertMessage: String = ""
    @Published var alertTitle: String = ""
    
    func recoveryPass(){
        RecoveryPassService.shared.recoveryPass(email: email) { result in
            self.loading = true
            DispatchQueue.main.async { [self] in
                self.loading = false
                self.generalResponse = result
                self.alertMessage = result.message!
                if(result.code == 200){
                    self.alertTitle = "OOPS"
                }else{
                    self.alertTitle = "Excelente"
                    emptyField()
                }
                self.alert = true
            }
        }
    }
    
    func emptyField() {
        self.email = ""
    }
    
    func validateField(){
        if(email.isEmpty){
            self.alert = true
            self.alertTitle = "OOPS"
            self.alertMessage = "Campo incompleto. Intentalo nuevamente."
        }else{
            recoveryPass()
        }
    }
}
