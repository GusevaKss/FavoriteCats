//  Created by Kseniya Kovgorenya on 4.06.24.

import UIKit
import Kingfisher


class CatCell: UITableViewCell {
    
    let catImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(catImageView)
        
        NSLayoutConstraint.activate([
                    catImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    catImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    catImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                ])
    }
    
    func configure(with url: String) {
            guard let imageUrl = URL(string: url) else { return }
            catImageView.kf.setImage(with: imageUrl)
        }
}
