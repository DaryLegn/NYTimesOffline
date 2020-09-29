//
//  Article.swift
//  DariaLegnTS
//
//  Created by Дарья Лень on 24.09.2020.
//  Copyright © 2020 Дарья Лень. All rights reserved.
//

import Foundation
import RealmSwift

class Article: Object, Decodable {
    
    @objc dynamic var title: String = ""
    @objc dynamic var abstract: String = ""
    @objc dynamic var publishedDate: String = ""
    @objc dynamic var byline: String = ""
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case abstract
        case publishedDate = "published_date"
        case byline
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.abstract = try container.decode(String.self, forKey: .abstract)
        self.publishedDate = try container.decode(String.self, forKey: .publishedDate)
        self.byline = try container.decode(String.self, forKey: .byline)
    }
}
struct ArticalsDetail: Decodable {
    
    let all: [Article]
    
    enum CodingKeys: String, CodingKey {
        case all = "results"
    }
}

