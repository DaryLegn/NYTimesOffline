//
//  MostEmailedTableViewCell.swift
//  DariaLegnTS
//
//  Created by Дарья Лень on 24.09.2020.
//  Copyright © 2020 Дарья Лень. All rights reserved.
//

import UIKit
import RealmSwift

var favoritesArr: [Article] = []

class MostEmailedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var data : Results<Article>!
    let realm = try? Realm()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteButton.setImage(UIImage(named:"favorite-icon-active"), for: .selected)
        favoriteButton.setImage(UIImage(named:"favorite-icon"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    @IBAction func addToFavorite(sender: UIButton?)  {
        
        data = realm?.objects(Article.self)
        
        let list = data[indexPath.section]
        
        if !sender!.isSelected {
            favoritesArr.append(list)
            
        } else {
            favoritesArr.remove(at: indexPath.section )
            if favoritesArr.count == 0 {
                favoritesArr.removeAll()
            }
        }
        sender?.isSelected = !sender!.isSelected
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return self.next(of: UITableView.self)
    }
    
    var indexPath: IndexPath {
        return (self.tableView?.indexPath(for: self))!
    }
}
extension UIResponder {
    
    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({ $0 as? U ?? $0.next() })
    }
}
