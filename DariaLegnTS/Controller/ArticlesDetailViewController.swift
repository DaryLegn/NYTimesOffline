//
//  ArticlesDetailViewController.swift
//  DariaLegnTS
//
//  Created by Дарья Лень on 24.09.2020.
//  Copyright © 2020 Дарья Лень. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftUI

class ArticlesDetailViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!  
    
    var titleExample: String?
    var abstractExample: String?
    var dateExample: String?
    var byLineExample: String?
    var isFavorite: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        setData()
    }
    
    func setData(){
        
        titleLabel.text = titleExample
        abstractTextView.text = abstractExample
        dateLabel.text = dateExample
        byLineLabel.text = byLineExample
    }
}
