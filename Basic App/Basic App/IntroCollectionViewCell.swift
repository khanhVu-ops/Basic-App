//
//  IntroCollectionViewCell.swift
//  Basic App
//
//  Created by KhanhVu on 5/18/22.
//

import UIKit

class IntroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDetail: UILabel!
    
    func config(data: IntroModel) {
        image.image = UIImage(named: "\(data.image)")
        lbTitle.text = data.title
        lbDetail.text = data.detail
    }
}
