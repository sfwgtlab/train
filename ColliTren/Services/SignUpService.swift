//
//  SignUpService.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 02/10/24.
//

import Foundation
class SignUpService{
    static let shared = SignUpService()
    
    func signUp(name: String, lastName: String, email: String, password: String, completion: @escaping(GeneralResponse) -> ()){
        guard let url = URL(string: Constants.baseUrl+"insert_user.php") else{
                   return
               }
              
               let datos : Data = "name=\(name)&lastName=\(lastName)&email=\(email)&password=\(password)".data(using: .utf8)!
               
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
