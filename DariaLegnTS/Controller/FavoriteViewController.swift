//
//  FavoriteViewController.swift
//  DariaLegnTS
//
//  Created by Дарья Лень on 24.09.2020.
//  Copyright © 2020 Дарья Лень. All rights reserved.
//

import UIKit
import RealmSwift

class FavoriteViewController: UIViewController {
    
    var emptyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        
        emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 121))
        emptyLabel?.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        emptyLabel?.textAlignment = .center
        emptyLabel?.text = "Favorites is empty"
        emptyLabel?.font = UIFont.systemFont(ofSize: 36.0)
        emptyLabel?.textColor = .gray
        self.view.addSubview(emptyLabel)
        
    }
}
// MARK: TableViewDelegate, TableViewDataSource
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return favoritesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! MostEmailedTableViewCell
        
        if favoritesArr.isEmpty == false {
            tableView.isHidden = false
            emptyLabel.isHidden = true
            let list = favoritesArr[indexPath.section]
            cell.titleLabel.text = list.title
            cell.abstractLabel.text = list.abstract
            cell.dateLabel.text = list.publishedDate
        }
        
        cell.backgroundColor = .clear
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}
