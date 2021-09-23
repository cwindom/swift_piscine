//
//  NewViewController.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 23.09.2021.
//

import Foundation
import UIKit

protocol PeopleDelegate: AnyObject {
    func addVictim(with name: String, reason: String, date: String)
}

class NewViewController: UIViewController {
    
    weak var peopleDelegate: PeopleDelegate?
    
    let nameField = UITextField(frame: CGRect(origin: .zero, size: CGSize(width: 240, height: 44)))
    
    let dateField = UITextField(frame: CGRect(origin: .zero, size: CGSize(width: 240, height: 44)))
    
    let descriptionField = UITextField(frame: CGRect(origin: .zero, size: CGSize(width: 240, height: 44)))
    
    @objc func actionButton() {
        
        navigationController?.popViewController(animated: true)
        
        guard let nameField = nameField.text,
              let descriptionField = descriptionField.text,
              let dateField = dateField.text else {
            return
        }
        peopleDelegate?.addVictim(with: nameField, reason: descriptionField, date: dateField)
    }
    
    override func viewDidLoad() {
        
        title = "Add a Person"
        
        view.backgroundColor = .white
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(actionButton))
        
        navigationItem.rightBarButtonItem = doneButton
        
        nameField.placeholder = "Name"
        descriptionField.placeholder = "Reason"
        dateField.placeholder = "Date"
        
        view.addSubview(nameField)
        nameField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionField)
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dateField)
        dateField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            descriptionField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            descriptionField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionField.topAnchor.constraint(equalTo: nameField.bottomAnchor),
            descriptionField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            dateField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dateField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dateField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor),
            dateField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        
    }
}
