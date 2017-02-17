//
//  repoCell.swift
//  GithubDemo
//
//  Created by Sean Nam on 2/16/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit
import AFNetworking

class repoCell: UITableViewCell {
    @IBOutlet weak var forksLabel: UILabel!

    @IBOutlet weak var forksIconImageView: UIImageView!
    @IBOutlet weak var starIconImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var repo: GithubRepo! {
        didSet {
            if let name = repo.name {
                nameLabel.text = name
            }
            
            if let owner = repo.ownerHandle {
                ownerLabel.text = owner
            }
            
            if let stars = repo.stars {
                starsLabel.text = "\(stars)"
            }
            
            if let forks = repo.forks {
                forksLabel.text = "\(forks)"
            }
            
            if let description = repo.repoDescription {
                descriptionLabel.text = description
            }
            
           
            if let thumbnailURL = repo.ownerAvatarURL {
                
                profileImageView.setImageWith(NSURL(string: thumbnailURL)! as URL)
                    
                    //(thumbnailURL as? URL)!)
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
