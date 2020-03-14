//
//  TicketConfirmViewController.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import UIKit

class TicketConfirmViewController: UIViewController {
    static func instantiate(tickets: [Ticket]) -> TicketConfirmViewController {
        let vc = TicketConfirmViewController.instantiate()
        vc.ticketCollection = TicketCollection(tickets: tickets)
        return vc
    }
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    private var ticketCollection: TicketCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: TicketConfirmCell.self)
        tableView.contentInset.bottom = heightConstraint.constant
        title = "購入内容の確認"
        amountLabel.text = ticketCollection.amount.label
    }
}

extension TicketConfirmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "チケット一覧 \(ticketCollection.tickets.count)枚"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketCollection.tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TicketConfirmCell.self, for: indexPath)
        let ticket = ticketCollection.tickets[indexPath.row]
        cell.update(with: ticket, theater: Theater(name: "シアター1", sheets: []))
        cell.selectionStyle = .none
        return cell
    }
    
}
