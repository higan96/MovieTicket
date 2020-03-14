//
//  TicketsViewController.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController {
    
    static func instantiate(program: Program, selectedSheets: [Sheet]) -> TicketsViewController {
        let vc = TicketsViewController.instantiate()
        
        vc.program = program
        vc.ticketTypeCollections = selectedSheets.map { TicketTypeCollection(sheet: $0, movie: program.movie, schedule: program.schedule) }
        
        return vc
    }
    
    @IBOutlet private var tableView: UITableView!
    private var program: Program!
    private var ticketTypeCollections: [TicketTypeCollection]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "チケット種別の選択"
    }
}

extension TicketsViewController: UITableViewDelegate,  UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ticketTypeCollections[section].sheet.label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ticketTypeCollections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketTypeCollections[section].ticketTypess.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ticketType = ticketTypeCollections[indexPath.section].ticketTypess[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath)
        cell.textLabel?.text = ticketType.label
        cell.detailTextLabel?.text = String(ticketType.ticket.charge.value)
        
        return cell
    }
}
