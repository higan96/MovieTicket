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
        
        let ticketTypeCollections = selectedSheets.map { TicketTypeCollection(sheet: $0, movie: program.movie, schedule: program.schedule) }
        
        vc.program = program
        vc.ticketTypeCollections = ticketTypeCollections
        vc.selector = TicketSelector(ticketTypeCollections: ticketTypeCollections)
        
        return vc
    }
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var emojiLabel: UILabel!
    
    
    private var program: Program!
    private var ticketTypeCollections: [TicketTypeCollection]!
    private var selector: TicketSelector!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "チケット種別の選択"
        tableView.contentInset.bottom = bottomViewHeight.constant
        reloadView()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let vc = TicketConfirmViewController.instantiate(tickets: selector.reservedTickets)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func reloadView() {
        nextButton.isEnabled = selector.isSelectedAll
        countLabel.text = "\(String(selector.reservedTickets.count)) / \(String(selector.sheetReservations.count))"
        emojiLabel.text = selector.isSelectedAll ? "😄" :  "😫"
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
        let sheet = ticketTypeCollections[indexPath.section].sheet
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath)
        cell.textLabel?.text = ticketType.label
        cell.detailTextLabel?.text = ticketType.ticket.charge.label
        cell.accessoryType = selector.isSelect(ticketType, at: sheet) ? .checkmark : .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sheet = ticketTypeCollections[indexPath.section].sheet
        let selectedTicket = ticketTypeCollections[indexPath.section].ticketTypess[indexPath.row].ticket
        
        selector.select(selectedTicket, sheet: sheet)
        tableView.reloadData()
        reloadView()
    }
}
