//
//  ViewController.swift
//  SopraSteria
//
//  Created by BMGH SRL on 15/05/2018.
//  Copyright © 2018 BMAGH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource = [1,2,3,4,5,6,7,8,9]
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.tableFooterView = UIView()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        dataSource =
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.with(value: dataSource[indexPath.row])
        
        return cell
    }
    
}

