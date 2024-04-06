//
//  MainViewController.swift
//  Lesson13HW
//

//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var contentView: MainView!
    
    var model: MainModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        
        model = MainModel()
        model.delegate = self
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

// MARK: - MainModelDelegate
extension MainViewController: MainModelDelegate {
    
    func dataDidLoad() {
        contentView.tableView.reloadData()
    }
}

// MARK: - MainViewDelegate
extension MainViewController: MainViewDelegate {
    
}
