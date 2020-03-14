//
//  TicketSelector.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

class TicketSelector {
    private(set) var sheetReservations: [SheetReservation]
    
    init(ticketTypeCollections: [TicketTypeCollection]) {
        self.sheetReservations = ticketTypeCollections.map { SheetReservation(sheet: $0.sheet, ticket: nil) }
    }
    
    var reservedTickets: [Ticket] {
        return sheetReservations.compactMap { $0.ticket }
    }
    
    var isSelectedAll: Bool {
        return self.reservedTickets.count == sheetReservations.count
    }
    
    func select(_ ticket: Ticket, sheet: Sheet) {
        guard let index = sheetReservations.firstIndex(where: { $0.sheet == sheet }) else { fatalError() }
        let sheetReservation = SheetReservation(sheet: sheet, ticket: ticket)
        
        sheetReservations.remove(at: index)
        sheetReservations.insert(sheetReservation, at: index)
    }
    
    func isSelect(_ ticketType: TicketType, at sheet: Sheet) -> Bool {
        guard let reservation = sheetReservations.first(where: { $0.sheet == sheet }) else { fatalError() }
        guard let ticket = reservation.ticket else { return false }
        return ticketType.equlatTo(ticket: ticket)
    }
}

struct SheetReservation {
    let sheet: Sheet
    let ticket: Ticket?
}
