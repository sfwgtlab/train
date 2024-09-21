//
//  LoginService.swift
//  ColliTren
//
//  Created by Eduardo Gutiérrez on 20/09/24.
//

import Foundation

class LoginService {
    static let shared = LoginService();
    
    func validateMail(email: String, pass: String, completion: @escaping(LoginResponse) -> ()){
            
            guard let url = URL(string: Constants.baseUrl+"validate_email.php")else{
                return
            }
            
            let datos: Data = "email=\(email)&pass=\(pass)".data(using: .utf8)!
            
            var request: URLRequest = URLRequest(url: url)
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
                    let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    completion(loginResponse!)
                }
                
            }
            
            task.resume()

        }
        
    
}
