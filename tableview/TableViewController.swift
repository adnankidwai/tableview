//
//  TableViewController.swift
//  tableview
//
//  Created by Adnan Kidwai on 4/23/21.
//

import UIKit

protocol ItemDetailsDelegate {
    func willPassItemDetails(itemDetails: String?)
}

class TableViewController: UITableViewController {
    
    let identifier = "identifier"
    var itemDetailsDelegate: ItemDetailsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        navigationItem.title = "@adnan"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        let composeImage = UIImage(systemName: "square.and.pencil")
        navigationController?.navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: composeImage,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(handleAdd))
    }
    
    @objc private func handleAdd() {
        let vc = AdnanAddItemController()
        let nc = UINavigationController(rootViewController: vc)
        vc.title = "@add item"
        present(nc, animated: true)
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = names[indexPath.row].name
        cell.textLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addItemController = ItemDetailViewController()
        let nc = UINavigationController(rootViewController: addItemController)
        addItemController.title = names[indexPath.row].name
        addItemController.detailsLabel.text = names[indexPath.row].details
        navigationController?.pushViewController(addItemController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension TableViewController: AddItemDelegate {
    func willAddNewItem(item: String?) {
        
        guard let item = item else { return }
        names.append(.init(name: item, details: nil))
        tableView.reloadData()
    }
}



