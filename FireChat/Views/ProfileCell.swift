//
//  ProfileCell.swift
//  Messaging
//
//  Created by Abhishek P Mukundan on 11/04/2020.
//  Copyright © 2020 Abhishek P Mukundan. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    //MARK: - Properties
    var viewModel: ProfileViewModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var iconView: UIView = {
       let view = UIView()
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.centerY(inView: view)
        
        view.backgroundColor = .systemPurple
        view.setDimensions(height: 40, width: 40)
        view.layer.cornerRadius = 40 / 2
        
        return view
    }()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(height: 28, width: 28)
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = UIStackView(arrangedSubviews: [iconView, titleLabel])
        stack.axis = .horizontal
        stack.spacing = 8
        
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    
    func configure() {
        guard let viewModel = viewModel else { return }
        
        iconImage.image = UIImage(systemName: viewModel.iconImageName)
        titleLabel.text = viewModel.description
    }
    
}



