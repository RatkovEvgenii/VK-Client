//
//  NetworkManager.swift
//  VK Client
//
//  Created by  Евгений Ратков on 23.09.21.
//

import Foundation

class RequestToAPI {

    var request: URLRequest? = nil
   
    func getResult(metod: String, params: String, paramsValue: String) {
        var METHOD = metod
            
        var PARAMS = params
            
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/\(METHOD)"
        urlComponents.queryItems = [
            URLQueryItem(name: PARAMS, value: paramsValue),
            URLQueryItem(name: "access_token", value: "\(Session.instance.token)"),
            URLQueryItem(name: "v", value: "5.81")
        ]
        request = URLRequest(url: urlComponents.url!)
        let session = URLSession.shared
                
        // задача для запуска
        let task = session.dataTask(with: request!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
                    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        // выводим в консоль
                    print(json)
                }
        // запускаем задачу
                task.resume()
    }
}
