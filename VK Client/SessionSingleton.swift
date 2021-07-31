//
//  SessionSingleton.swift
//  VK Client
//
//  Created by  Евгений Ратков on 31.07.21.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var token: String = ""
    var userID: Int = 0
   
}
