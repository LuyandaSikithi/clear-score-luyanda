//
//  DetailsTableViewCell.swift
//  ClearScore
//
//  Created by Luyanda Sikithi on 2022/08/07.
//

import UIKit

struct ConfigureCell {
    var title: String?
    var amount: Int?
}

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        styling()
    }
    
    private func styling() {
        containerView.layer.cornerRadius = 10
        containerView.layer.cornerCurve = .continuous
    }
    
    func getValues(_ config: ConfigureCell) {
        guard let amount = config.amount else { return }
        titleLabel.text = config.title
        if config.title == Constants.detailsTitles.creditUsed {
            amountLabel.text = "\(amount)"
        }else{
            amountLabel.text = "R\(amount)"
        }
    }
}
