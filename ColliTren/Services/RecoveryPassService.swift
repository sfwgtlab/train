//
//  RecoveryPassService.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 13/10/24.
//

import Foundation
class RecoveryPassService{
    static let shared = RecoveryPassService()
    
    func recoveryPass(email: String, completion: @escaping(GeneralResponse) -> ()) {
        guard let url = URL(string: Constants.baseUrl+"email_recover_pass.php") else{
                   return
               }
              
               let datos : Data = "email=\(email)".data(using: .utf8)!
               
               var request : URLRequest = URLRequest(url: url)
               request.httpMethod = "POST"
               request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
               request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
               request.httpBody = datos
               let config = URLSessionConfiguration.default
               let session = URLSession(configuration: config)
           
               let task = session.dataTask(with: request){
                   data, response, error in
                   
                   guard let data = data, error == nil else {return}
                   
                   do{
                       let generalResponse = try? JSONDecoder().decode(GeneralResponse.self, from: data)
                       
                       completion(generalResponse!)
                   }
                   
               }
               
               task.resume()
    }
}
