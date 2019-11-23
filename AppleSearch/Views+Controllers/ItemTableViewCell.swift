//
//  ItemTableViewCell.swift
//  AppleSearch
//
//  Created by Chris Anderson on 11/21/19.
//  Copyright © 2019 Renaissance Apps. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
   
    @IBOutlet weak var descriptiveSongLabel: UILabel!
    @IBOutlet weak var descriptiveAlbumLabel: UILabel!
    @IBOutlet weak var desriptiveArtistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        designLabels()
    }
    
    
    func designLabels() {
        DispatchQueue.main.async {
            self.albumLabel.layer.borderWidth = 2.0;
            self.albumLabel.layer.borderColor = UIColor.cyan.cgColor;
            self.subtitleLabel.layer.borderWidth = 2.0;
            self.subtitleLabel.layer.borderColor = UIColor.cyan.cgColor;
            self.itemTitleLabel.layer.borderWidth = 2.0;
            self.itemTitleLabel.layer.borderColor = UIColor.cyan.cgColor;
            self.descriptiveSongLabel.layer.borderWidth = 2.0;
            self.descriptiveSongLabel.layer.borderColor = UIColor.cyan.cgColor;
            self.descriptiveAlbumLabel.layer.borderWidth = 2.0;
            self.descriptiveAlbumLabel.layer.borderColor = UIColor.cyan.cgColor;
            self.desriptiveArtistLabel.layer.borderWidth = 2.0;
            self.desriptiveArtistLabel.layer.borderColor = UIColor.cyan.cgColor;
        }
    }
    var item: AppStoreItem? {
        didSet {
            guard let item = item else { return }
            
//            switch  {
//            case :
//                descriptiveSongLabel.text = "Title:"
//                descriptiveAlbumLabel.text = "Rating:"
//                desriptiveArtistLabel.text = "Release Date:"
//            case :
//                descriptiveSongLabel.text = "Song:"
//                descriptiveAlbumLabel.text = "Album:"
//                desriptiveArtistLabel.text = "Artist:"
//            }
            
            albumLabel.text = item.album
            itemTitleLabel.text = item.title
            subtitleLabel.text = item.subtitle
            itemImageView.image = nil
            AppStoreItemController.getImageFor(item: item) { (image) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.itemImageView.image = image
                    }
                } else {
                    print("image was nil.")
                }
            }
        }
    }

}
