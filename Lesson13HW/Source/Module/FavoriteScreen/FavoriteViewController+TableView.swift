//
//  FavoriteViewController+TableView.swift
//  Lesson13HW
//
//  Created by Aleksandr Moroshovskyi on 06.04.2024.
//

import UIKit

// MARK: - UITableViewDataSource
extension FavoriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.favoriteItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.idintifier) as? FavoriteTableViewCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let item = model.favoriteItems[indexPath.row]
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = item.model + ", " + item.manufacturer
        
        cell.idLabel.text = "код товару: \(item.id)"
        cell.nameLabel.text = item.name
        cell.mmLabel.text = "\(item.manufacturer), \(item.model)"
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FavoriteViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return FavoriteTableViewCell.setHeightForCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            //model.items.remove(at: indexPath.row)
            model.removeFromFavorite(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
