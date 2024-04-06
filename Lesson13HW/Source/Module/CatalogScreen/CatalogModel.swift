//
//  CatalogModel.swift
//  Lesson13HW
//

//

import Foundation

protocol CatalogModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class CatalogModel {
    
    weak var delegate: CatalogModelDelegate?
    private let dataLoader = DataLoaderService()
    private let localStorage = LocalStorageService()
    
    var pcItems: [Pc] = []
    
    func setFavorites() {
        
        let favoriteItems = localStorage.getFavorites()
        
        pcItems.enumerated().forEach { index, item in
            if !favoriteItems.filter({ item.id == $0.id }).isEmpty {
                pcItems[index].isFavorite = true
            }
        }
    }
    
    func loadData() {
        
        dataLoader.loadCatalog { [weak self] catalog in
            guard let self = self else { return }
            
            self.pcItems = catalog?.data ?? []
            setFavorites()
            
            self.delegate?.dataDidLoad()
        }
    }
    
    func updateItem(with isFavorite: Bool, at index: Int) {
        
        pcItems[index].isFavorite = isFavorite
    }
    
    func saveChangesIfNeeded() {
        
        let favoriteItems = getFavoriteItems()
        let savedItems = localStorage.getFavorites()
        
        guard savedItems != favoriteItems else { return }
        
//        let totalSet: Set<Favorite> = Set(savedItems + favoriteItems)
//        
//        localStorage.saveFavorites(Array(totalSet))
        localStorage.saveFavorites(favoriteItems)
    }
    
    private func getFavoriteItems() -> [Favorite] {
        
        return pcItems.filter({ $0.favorite() }).compactMap {
            Favorite(
                id: $0.id,
                name: $0.name,
                manufacturer: $0.manufacturer,
                model: $0.model
            )
        }
    }
}
