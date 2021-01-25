//
//  EventViewCell.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import UIKit
import Kingfisher

class EventViewCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var venueName: UILabel!
    
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func configureEvent(with viewModel : EventViewModel)  {
       
        eventImage.kf.setImage(with: viewModel.image)
        nameLabel.text =  viewModel.name
        venueName.text = viewModel.venueName
        
        let fullDateArr = viewModel.eventDate.components(separatedBy: " ")

        dayName.text = fullDateArr[0]
        dayLabel.text = fullDateArr[1]
        monthLabel.text = fullDateArr[2]
        
        timeLabel.text = "\(viewModel.startTime) - \(viewModel.endTime)"
        
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
