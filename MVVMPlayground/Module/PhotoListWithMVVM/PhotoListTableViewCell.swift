//
//  PhotoListTableViewCell.swift
//  MVVMPlayground
//
//  Created by Mohamed Ezzat on 6/3/22.
//

import Foundation
import UIKit

class PhotoListTableViewCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descContainerHeightConstraint: NSLayoutConstraint!
    var photoListCellViewModel : PhotoListCellViewModel? {
        didSet {
            nameLabel.text = photoListCellViewModel?.titleText
            mainImageView?.sd_setImage(with: URL( string: photoListCellViewModel?.imageUrl ?? "" ), completed: nil)
            
        }
    }
}
