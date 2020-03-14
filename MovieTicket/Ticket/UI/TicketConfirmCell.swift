//
//  TicketConfirmCell.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import UIKit

class TicketConfirmCell: UITableViewCell {
    
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var scheduleLabel: UILabel!
    @IBOutlet private weak var theaterLabel: UILabel!
    @IBOutlet private weak var sheetLabel: UILabel!
    @IBOutlet private weak var ticketTypeLabel: UILabel!
    @IBOutlet private weak var chargeLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with ticket: Ticket, theater: Theater) {
        movieNameLabel.text = ticket.movie.name
        scheduleLabel.text = ticket.schedule.dateLabel + ticket.schedule.startAtLabel
        theaterLabel.text = theater.name
        sheetLabel.text = ticket.sheet.label
        ticketTypeLabel.text = ticket.label
        chargeLabel.text = ticket.charge.label
    }
}
