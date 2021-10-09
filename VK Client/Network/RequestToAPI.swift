//
//  NetworkManager.swift
//  VK Client
//
//  Created by  Евгений Ратков on 23.09.21.
//

import Foundation

class RequestToAPI {

    var request: URLRequest? = nil
   
    func getResult(url: URL) {
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "api.vk.com"
//        urlComponents.path = "/method/\(metod)"
//        urlComponents.queryItems = [
//            URLQueryItem(name: params, value: paramsValue),
//            URLQueryItem(name: "access_token", value: "\(Session.instance.token)"),
//            URLQueryItem(name: "v", value: "5.131")
//        ]
//        request = URLRequest(url: urlComponents.url!)
//
        request = URLRequest(url: url)
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
// 
//        requestToAPI.getResult(metod: "photos.getAll", params: "user_ids", paramsValue: String(Session.instance.userID))
//        requestToAPI!.getResult(metod: "groups.get", params: "user_ids", paramsValue: String(Session.instance.userID))
//        requestToAPI.getResult(metod: "groups.search", params: "q", paramsValue: "КБ", paramsValue: String(Session.instance.userID))
