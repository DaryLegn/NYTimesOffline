//
//  MainViewController.swift
//  DariaLegnTS
//
//  Created by Дарья Лень on 24.09.2020.
//  Copyright © 2020 Дарья Лень. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class MainViewController: UIViewController{
    
    @IBOutlet weak var mostEmailedTableView: UITableView?
    
    var items = [Article]()
    var data : Results<Article>!
    let realm = try? Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        fetchArticles()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:
            UIColor.black,
                                                                   NSAttributedString.Key.font:
                                                                    UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.thin)]
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.layer.borderColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.borderWidth = 0.3
    }
    
// MARK: Fetching data from the server
    func fetchArticles(){
        
        DispatchQueue.main.async() {
            AF.request("https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=qat9syyAtYIyrdFl4tNL1oRX5aI8Y7DP")
                .validate()
                .responseDecodable(of: ArticalsDetail.self) { ( response ) in
                    guard let result = response.value else { return }
                    self.items = result.all
                    self.save(objects: self.items)
            }
            self.mostEmailedTableView?.reloadData()
        }
    }
    
// MARK: Save data to Realm
    func save<T:Object>(objects: [T]){
        
        do{
            try realm?.write {
                realm?.add(objects)
            }
        } catch {
            print("Error saving data: \(error)")
        }
    }
}
// MARK: TableViewDelegate, TableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MostEmailedTableViewCell
        
        data = realm?.objects(Article.self)
        let list = data[indexPath.section]
        
        cell.titleLabel.text = list.title
        cell.abstractLabel.text = list.abstract
        cell.dateLabel.text = list.publishedDate
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let barVC = segue.destination as! UITabBarController
        if let destination = barVC.viewControllers![0] as? ArticlesDetailViewController{
            
            guard let selectedSection = mostEmailedTableView?.indexPathForSelectedRow?.section else {return}
            data = realm?.objects(Article.self)
            
            destination.titleExample = data[selectedSection].title
            destination.abstractExample = data[selectedSection].abstract
            destination.dateExample = data[selectedSection].publishedDate
            destination.byLineExample = data[selectedSection].byline
        }
    }
}

extension UIViewController{
    
    func setBackground(){
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "whiteBack")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
}
