//
//  Database.swift
//  VK Client
//
//  Created by  Евгений Ратков on 12.11.21.
//

import Foundation
import RealmSwift

class Database {
    
    private var db: Realm?
    
    init() {
        db = try? Realm()
        Realm.Configuration.defaultConfiguration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        print(db?.configuration.fileURL)
        
    }
    
    func saveFriendData(_ friends: [Friend]) {
// обработка исключений при работе с хранилищем
        do {
// получаем доступ к хранилищу
            let realm = try Realm()
            
// начинаем изменять хранилище
            realm.beginWrite()
            
// кладем все объекты класса погоды в хранилище
            realm.add(friends, update: .all)
            
// завершаем изменения хранилища
            try realm.commitWrite()
        } catch {
// если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }
    
    func read() -> [Friend]? {
        if let objects = db?.objects(Friend.self) {
            return Array(objects)
        }
        return nil
    }
}
