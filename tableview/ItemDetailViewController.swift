//
//  ItemAdditionController.swift
//  tableview
//
//  Created by Adnan Kidwai on 4/30/21.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    let detailsLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(detailsLabel)
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsLabel.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            detailsLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension ItemDetailViewController: ItemDetailsDelegate {
    func willPassItemDetails(itemDetails: String?) {
        detailsLabel.text = itemDetails
    }
    
    
}
