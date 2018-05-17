//
//  News.swift
//  SopraSteria
//
//  Created by BMGH SRL on 16/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class News: Object {
    
    enum Property: String {
        case title, image, subtitle
    }
    
    dynamic var title: String = ""
    dynamic var image: String = ""
    dynamic var subtitle : String = ""
    
    override static func primaryKey() -> String {
        return News.Property.title.rawValue
    }
    
    convenience init (_ title: String) {
        self.init()
        self.title = title
    }
    
}

extension News {
    
    
    static func all(in realm: Realm = try! Realm()) -> Results<News> {
        return realm.objects(News.self)
    }
    
    @discardableResult
    static func add(title: String, in realm: Realm = try! Realm()) -> News {
        let item = News(title)
        try! realm.write {
            realm.add(item, update: true)
        }
        return item
    }
    
}
