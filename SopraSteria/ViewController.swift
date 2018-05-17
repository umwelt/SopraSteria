//
//  ViewController.swift
//  SopraSteria
//
//  Created by BMGH SRL on 15/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var notificationToken: NotificationToken? = nil
    
    @IBAction func addItemWasPressed(_ sender: Any) {
        print("addItem")
        News.add(title: "Tomorrow latest news")
    }
    
    
//    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
    var dataSource: Results<News>?
    
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
        title = "News"
        
        dataSource = News.all()
        notificationToken = dataSource?.observe({ [weak self] (changes: RealmCollectionChange) in
            
            guard let `self` = self else { return }
            
            switch changes {
                
            case .initial(_):
                self.tableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self.tableView.beginUpdates()
                
                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                     with: .automatic)
                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                     with: .automatic)
                
                self.tableView.endUpdates()
            case .error(_):
                print("error")
            }
            
        })
        
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
        
        return dataSource?.count ?? 0
        
//        if let _count = dataSource {
//            return _count.count
//        }
//        return 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath) as! CustomTableViewCell
        
        cell.with(news: dataSource![indexPath.row])
        
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



