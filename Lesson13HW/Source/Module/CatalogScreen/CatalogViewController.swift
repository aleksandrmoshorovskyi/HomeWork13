//
//  CatalogViewController.swift
//  Lesson13HW
//

//

import UIKit

class CatalogViewController: UIViewController {
    
    @IBOutlet weak var contentView: CatalogView!
    
    var model: CatalogModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        model.loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        model.saveChangesIfNeeded()
    }
    
    private func setupInitialState() {
        
        title = "Catalog"
        
        model = CatalogModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
        let nib = UINib(nibName: "CatalogTableViewCell", bundle: nil)
        contentView.tableView.register(nib, forCellReuseIdentifier: "CatalogTableViewCell")
    }
}

// MARK: - CatalogModelDelegate
extension CatalogViewController: CatalogModelDelegate {
    
    func dataDidLoad() {
        
        contentView.tableView.reloadData()
    }
}

// MARK: - CatalogViewDelegate
extension CatalogViewController: CatalogViewDelegate {
    
}
