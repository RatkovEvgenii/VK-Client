//
//  WebLoginViewController.swift
//  VK Client
//
//  Created by  Евгений Ратков on 31.07.21.
//

import UIKit
import WebKit


class WebLoginViewController: UIViewController {
    private var requestToAPI: RequestToAPI = RequestToAPI()
    @IBOutlet weak var webview: WKWebView! {
        didSet{
            webview.navigationDelegate = self
            var urlComponents = URLComponents()
            
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7916063"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
            ]
            
            let request = URLRequest(url: urlComponents.url!)
            
            webview.load(request)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension WebLoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        let userID = Int(params["user_id"] ?? "0")
        
        Session.instance.token = token ?? ""
        Session.instance.userID = userID ?? 0
        print("token = ", token)
        print("userID = ", userID)
        print("получили токен и айди")
        
//        requestToAPI.getResult(metod: "friends.get", params: "user_ids")
//        requestToAPI.getResult(metod: "photos.getAll", params: "user_ids")
//        requestToAPI!.getResult(metod: "groups.get", params: "user_ids", paramsValue: String(Session.instance.userID))
        requestToAPI.getResult(metod: "groups.search", params: "q", paramsValue: "КБ")

        
        decisionHandler(.cancel)
    }
}
