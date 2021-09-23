//
//  ViewController.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 23.09.2021.
//

import UIKit

class ViewController: UIViewController, PeopleDelegate {
    
    var people = [People]()
    
    lazy var tableView: UITableView = {
           
           let table = UITableView()
           table.translatesAutoresizingMaskIntoConstraints = false
           table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
           table.delegate = self
           table.dataSource = self
           return table
       }()

    @objc func actionPlus() {
        
        let vc = NewViewController()
        
        vc.peopleDelegate = self
        
        navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Death Note"
        
        view.backgroundColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actionPlus))
        
        view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
                   tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                   tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                   tableView.topAnchor.constraint(equalTo: view.topAnchor),
                   tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               ])
        
        addVictim(with: "Garth Tyrell Lormelle", reason: "cat", date: "10.09.2021")
        addVictim(with: "Card Windom", reason: "fish", date: "10.09.2021")
        addVictim(with: "Whitney Phylicia", reason: "beer", date: "10.09.2021")
        addVictim(with: "Gamgee Velva", reason: "dog", date: "10.09.2021")
    
    }
    
    func addVictim(with name: String, reason: String, date: String) {
        
        let newPeople = People(name: name, reason: reason, date: date)
        
        people.append(newPeople)
        
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.backgroundColor = .white
        
        let data = people[indexPath.row]
        
        cell.dateLabel.text = data.date
        cell.nameLabel.text = data.name
        cell.reasonLabel.text = data.reason
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
}
