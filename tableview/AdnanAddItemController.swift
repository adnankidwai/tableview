//
//  ViewController.swift
//  tableview
//
//  Created by Adnan Kidwai on 4/22/21.
//

import UIKit

protocol AddItemDelegate {
    func willAddNewItem(item: String?)
}


class AdnanAddItemController: UIViewController {
    
    var addItemDelegate: AddItemDelegate?
    
    
    let testView: UILabel = {
        let l = UILabel()
        l.text = "testing"
        l.font = UIFont.systemFont(ofSize: 30)
        l.backgroundColor = .systemBackground
        l.textAlignment = .center
        l.layer.cornerRadius = 30
        l.layer.masksToBounds = true
        return l
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "enter item"
        tf.font = UIFont.systemFont(ofSize: 30)
        tf.backgroundColor = .secondarySystemBackground
        tf.textAlignment = .center
        tf.layer.cornerRadius = 30
        tf.layer.masksToBounds = true
        return tf
    }()
    
    let addButton: UIButton = {
       let button = UIButton()
        button.setTitle("add", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    //MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addButton.addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        setupViews()
    }
    
    @objc private func handleAdd() {
        
//        if let item = textField.text {
//            print(item)
//            addItemDelegate?.didAddItem(item: item)
//        }
        
        guard let item = textField.text else { return }
        
        addItemDelegate?.willAddNewItem(item: item)
        
        dismiss(animated: true)
    }
    
    private func setupViews() {
//        view.addSubview(testView)
        view.addSubview(textField)
        view.addSubview(addButton)
        testView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
//            testView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            testView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            testView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            testView.heightAnchor.constraint(equalToConstant: 200)
            
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 200),
            
            addButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 100),
            addButton.centerXAnchor.constraint(equalTo: textField.centerXAnchor)
            
        ])
    }


}

