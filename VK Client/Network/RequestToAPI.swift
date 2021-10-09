//
//  NetworkManager.swift
//  VK Client
//
//  Created by  Евгений Ратков on 23.09.21.
//

import Foundation
import RealmSwift

class RequestToAPI {
    var urlRequest: URL? = nil
    var request: URLRequest? = nil
    
    func setURL (url: URL) {
        urlRequest = url
    }
    //
    func getResult(handler: @escaping (([Friend]) -> Void)) {
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
        request = URLRequest(url: urlRequest!)
        let session = URLSession.shared
        
        // задача для запуска
//        let task = session.dataTask(with: request!) { (data, response, error) in
//            // в замыкании данные, полученные от сервера, мы преобразуем в json
//            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
//            // выводим в консоль
//           print(json)
//        }
        
        URLSession.shared.dataTask(with: request!) { (data, response, error) in
            if data != nil && error == nil {
                let apiResponse = try? JSONDecoder().decode(NetworkResponce.self, from: data!)
                if apiResponse != nil {
                    let response = apiResponse?.response
                    let items = response?.items
                    
                    //print(items!.count)
                    DispatchQueue.main.async{
                        self.saveFriendData(items!)
                        
                    }
                    handler(items!)
                } else {
                    print("json parse error")
                }
            } else {
                print("network error")
            }
        }
        // запускаем задачу
        .resume()
    }
    
    func getImage(by urlStr: String, handler: @escaping ((Data?) -> Void))  {
        guard  let url = URL(string: urlStr) else {return}
        
        if let data = try? Data(contentsOf: url) {
            handler(data)
        }
    }
    //сохранение погодных данных в Realm
        func saveFriendData(_ friends: [Friend]) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
                
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(friends)
                
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

}
// 
//        requestToAPI.getResult(metod: "photos.getAll", params: "user_ids", paramsValue: String(Session.instance.userID))
//        requestToAPI!.getResult(metod: "groups.get", params: "user_ids", paramsValue: String(Session.instance.userID))
//        requestToAPI.getResult(metod: "groups.search", params: "q", paramsValue: "КБ", paramsValue: String(Session.instance.userID))
