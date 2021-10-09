//
//  Friends.swift
//  VK Client
//
//  Created by  Евгений Ратков on 10.10.21.
//

import Foundation
import RealmSwift

class Friend: Object, Codable {
    @objc dynamic var first_name: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var last_name: String = ""
    @objc dynamic var photo_50: String = ""
    @objc dynamic var online: Int = 0
}
