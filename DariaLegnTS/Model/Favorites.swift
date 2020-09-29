//
//  Favorites.swift
//  DariaLegnTS
//
//  Created by Дарья Лень on 24.09.2020.
//  Copyright © 2020 Дарья Лень. All rights reserved.
//

import Foundation
import RealmSwift

class Favorites: NSObject  {
    
    @objc dynamic var title: String?
    @objc dynamic var abstract: String?
    @objc dynamic var publishedDate: String?
    @objc dynamic var byline: String?
}
