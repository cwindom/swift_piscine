//
//  ViewController.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 25.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, APITwitterDelegate {
    
    var api: APIController!
    
    lazy var tableView: UITableView = {
           
           let table = UITableView()
           table.translatesAutoresizingMaskIntoConstraints = false
           table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
           table.delegate = self
           table.dataSource = self
           return table
       }()
    
    func manageTweets(_ tweets: [Tweet]) {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.tableView.reloadData()
        }
    }
    
    func manageError(_: NSError) {
        
        tableView.reloadData()
        print("error")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Tweets"
        
        api = APIController(delegate: self, token: "AAAAAAAAAAAAAAAAAAAAAO3k9gAAAAAAYiCjT11ullplhI%2FwD7DfpQCK2B0%3De7YvgUGT6pCgqAFbq0qqyKvWxlIwgqsjGV6WVTBzrTJpzTYGTk")
        api.request(requestString: "school 21")
        
        navigationController?.navigationBar.prefersLargeTitles = true
               view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let data = api.tweets[indexPath.row]
        
        cell.nameLabel.text = data.name
        cell.explanLabel.text = data.text
        
        return cell
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            api.tweets.count
        }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            UITableView.automaticDimension
        }
        
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            
            300
        }


}

