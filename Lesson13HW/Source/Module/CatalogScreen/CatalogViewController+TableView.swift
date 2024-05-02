//
//  CatalogViewController+TableView.swift
//  Lesson13HW
//
//  Created by Aleksandr Moroshovskyi on 06.04.2024.
//

import UIKit

// MARK: - UITableViewDataSource
extension CatalogViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.pcItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogCell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatalogTableViewCell") as? CatalogTableViewCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let item = model.pcItems[indexPath.row]
//        cell.textLabel?.text = item.name
//        cell.detailTextLabel?.text = item.model
//
//        cell.accessoryType = (item.isFavorite ?? false) ? .checkmark : .none
        
        cell.idLabel.text = "код товару: \(item.id)"
        cell.nameLabel.text = item.name
        cell.mmLabel.text = "\(item.manufacturer), \(item.model)"
        
        //замість img
        let starImg = "⭐️"
        var stars = ""
        var itemRating = item.rating
        
        itemRating = itemRating > 5 ? 5 : itemRating
        
        if itemRating > 0 {
            for _ in 1...itemRating {
                stars += starImg
            }
        }
        
        cell.ratingLabel.text = stars
        cell.priceCurrencyLabel.text = "\(item.price), \(item.currency)"
        
        cell.favoriteButton.setTitle(model.pcItems[indexPath.row].favorite() ? "💙" : "🤍", for: .normal)
        cell.favoriteButton.setTitle(model.pcItems[indexPath.row].favorite() ? "💙" : "🤍", for: .selected)
        
        cell.favoriteButtonActionCompletion = { [weak self, cell] in
            guard let self = self else { return }
            
            let isFavorite = !model.pcItems[indexPath.row].favorite()
            model.updateItem(with: isFavorite, at: indexPath.row)
  
            cell.favoriteButton.setTitle(isFavorite ? "💙" : "🤍", for: .normal)
            cell.favoriteButton.setTitle(isFavorite ? "💙" : "🤍", for: .selected)
        }
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CatalogViewController: UITableViewDelegate {
    
}
/*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let isFavorite = !model.pcItems[indexPath.row].favorite()
        model.updateItem(with: isFavorite, at: indexPath.row)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = isFavorite ? .checkmark : .none
    }
}
 */

