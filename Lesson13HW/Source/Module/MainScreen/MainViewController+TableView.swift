//
//  MainViewController+TableView.swift
//  Lesson13HW
//
//  Created by Aleksandr Moroshovskyi on 06.04.2024.
//

import UIKit

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell")
        else {
            return UITableViewCell()
        }
        
        let item = model.sections[indexPath.section].items[indexPath.row]
        cell.textLabel?.text = item.titleText
        cell.detailTextLabel?.text = item.descriptionText
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = model.sections[indexPath.section].items[indexPath.row].type
        var vc: UIViewController?
        
        switch type {
        case .catalog:
            vc = CatalogViewController.fromMainStoryboard()
        case .favorite:
            vc = FavoriteViewController.fromMainStoryboard()
        case .none: break
        }
        
        guard let viewController = vc else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
