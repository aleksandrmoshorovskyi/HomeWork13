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
        //label.backgroundColor = Constant.labelColor
        
        contentView.addSubview(label)
        
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        
        let label = UILabel()
        //label.backgroundColor = Constant.labelColor
        
        contentView.addSubview(label)
        
        return label
    }()
    
    lazy var mmLabel: UILabel = {
        
        let label = UILabel()
        //label.backgroundColor = Constant.labelColor
        
        contentView.addSubview(label)
        
        return label
    }()
    
    static func setHeightForCell() -> CGFloat {
        
        return (Constant.constraintDistance + Constant.lableHeight) * 3
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
            // MARK: - idLabel
            idLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constant.constraintDistance
            ),
            idLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constant.constraintDistance
            ),
            idLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: contentView.trailingAnchor,
                constant: -Constant.constraintDistance
            ),
            idLabel.heightAnchor.constraint(
                equalToConstant: Constant.lableHeight
            ),
            
            // MARK: - nameLabel
            nameLabel.topAnchor.constraint(
                equalTo: idLabel.bottomAnchor,
                constant: Constant.constraintDistance
            ),
            nameLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constant.constraintDistance
            ),
            nameLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: contentView.trailingAnchor,
                constant: -Constant.constraintDistance
            ),
            nameLabel.heightAnchor.constraint(
                equalToConstant: Constant.lableHeight
            ),
            
            // MARK: - mmLabel
            mmLabel.topAnchor.constraint(
                equalTo: nameLabel.bottomAnchor,
                constant: Constant.zeroDistance
            ),
            mmLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constant.constraintDistance
            ),
            mmLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: contentView.trailingAnchor,
                constant: -Constant.constraintDistance
            ),
            mmLabel.heightAnchor.constraint(
                equalToConstant: Constant.lableHeight
            )
        ])
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

private class Constant {
    
    static let constraintDistance: CGFloat = 20
    static let lableHeight: CGFloat = 30
    static let zeroDistance: CGFloat = 0
    
    static let labelColor: UIColor = .systemRed
}
