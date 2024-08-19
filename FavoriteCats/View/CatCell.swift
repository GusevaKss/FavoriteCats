//  Created by Kseniya Kovgorenya on 4.06.24.

import UIKit
import Kingfisher


class CatCell: UITableViewCell {
    
    let containerView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.layer.cornerRadius = 10
           view.clipsToBounds = true
           return view
       }()
    
    let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(catImageView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            catImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            catImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            catImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            catImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func configure(with url: String) {
        guard let imageUrl = URL(string: url) else { return }
        catImageView.kf.setImage(with: imageUrl)
    }
}
