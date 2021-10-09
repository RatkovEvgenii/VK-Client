//
//  TestViewController.swift
//  VK Client
//
//  Created by  Евгений Ратков on 9.10.21.
//

import UIKit

class TestViewController: UIViewController {
    var requestToAPI = RequestToAPI()
    var friend: [Friend] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestToAPI.setURL(url: setURL())
        requestToAPI.getResult(handler: { [self] items in
            self.friend = items
            
            
        })
        // Do any additional setup after loading the view.
    }
    

    func setURL() -> URL{
        // https://api.vk.com/method/friends.get?user_ids=53021558&access_token=df76ae8d37ef1d92dfac822559b63ecdb201cb4064b05b3eb4f6a76124de618f2b6580b418a58d00d1591&v=5.131
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            //URLQueryItem(name: "user_id", value: String(Session.instance.userID)),
            URLQueryItem(name: "fields", value: "photo_50,online"),
            URLQueryItem(name: "count", value: "3"),
            URLQueryItem(name: "access_token", value: String(Session.instance.token)),
            URLQueryItem(name: "v", value: "5.131")
        ]
        print (urlComponents.url)
        return urlComponents.url!
    }

}

