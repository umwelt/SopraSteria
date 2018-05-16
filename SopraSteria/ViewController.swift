//
//  ViewController.swift
//  SopraSteria
//
//  Created by BMGH SRL on 15/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource = [News]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(CustomTableViewCell.self,
                               forCellReuseIdentifier: CustomTableViewCell.identifier)
            tableView.tableFooterView = UIView()
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 150
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dataSource = provider()
        
        tableView.reloadData()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    /// Scope of extension
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // dataSource.count
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath) as! CustomTableViewCell
        cell.with(news: dataSource[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let sopraCollectionController = SopraCollectionViewController()
            self.navigationController?.pushViewController(sopraCollectionController, animated: true)
            
        } else {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController")
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }

        
    }
    

 
    
}

extension ViewController {
    
    
    func provider() -> [News] {
        
        var allNews = [News]()
        
        let news1 = News(title: "One", image: "filled_star", subtitle: "Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a tableview cell's content view. We're considering the collapse unintentional and using standard height instead.")
        
        let news2 = News(title: "Two", image: "notificationBell", subtitle: "Warning once only: Detected a case where constraints ambiguously.")
        
        let news3 = News(title: "Three", image: "profileAvatar", subtitle: "Warning once only: Detected a case where constraints ambiguously suggest a height of zero for a tableview cell's content view. We're considering the collapse unintentional and using standard height instead.")
        allNews = [news1, news2, news3]
        
        return allNews
    }
}

