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
        vc.tickets = tickets
        return vc
    }
    
    @IBOutlet private weak var tableView: UITableView!
    private var tickets: [Ticket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: TicketConfirmCell.self)
    }
}

extension TicketConfirmViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tickets.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TicketConfirmCell.self, for: indexPath)
        let ticket = tickets[indexPath.row]
        cell.update(with: ticket, theater: Theater(name: "シアター1", sheets: []))
        cell.selectionStyle = .none
        return cell
    }
    
}
