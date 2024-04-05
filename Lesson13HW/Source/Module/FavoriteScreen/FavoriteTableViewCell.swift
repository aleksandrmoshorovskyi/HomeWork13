//
//  FavoriteTableViewCell.swift
//  Lesson13HW
//
//  Created by Aleksandr Moroshovskyi on 05.04.2024.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    static let idintifier = "UITableViewCell"
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .systemRed
        
        contentView.addSubview(label)
        
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .systemRed
        
        contentView.addSubview(label)
        
        return label
    }()
    
    lazy var mmLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .systemRed
        
        contentView.addSubview(label)
        
        return label
    }()
    
    static func setHeightForCell() -> CGFloat {
        
        return distance * 3 + height * 3
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .systemGray6
        setConstraint()
    }
    
    func setConstraint() {
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        mmLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: distance),
            idLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: distance),
            idLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -distance),
            idLabel.heightAnchor.constraint(equalToConstant: height),
            
            nameLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: distance),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: distance),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -distance),
            nameLabel.heightAnchor.constraint(equalToConstant: height),
            
            mmLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: zero),
            mmLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: distance),
            mmLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -distance),
            mmLabel.heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
