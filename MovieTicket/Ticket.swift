//
//  Ticket.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

enum TicketType {
    case normal(NormalTicket)
    case child(ChildTicket)
    case shoolStudent(SchoolStudentTicket)
    case universityStudent(UniversityStudentTicket)
    case senior(SeniorTicket)
    
    var label: String {
        switch self {
        case .normal:
            return "一般"
        case .child:
            return "幼児・小学生"
        case .shoolStudent:
            return "中学生・高校生"
        case .universityStudent:
            return "大学生・専門学校生"
        case .senior:
            return "シニア"
        }
    }
    
    var ticket: Ticket {
        switch self {
        case .normal(let ticket): return ticket
        case .child(let ticket): return ticket
        case .shoolStudent(let ticket): return ticket
        case .universityStudent(let ticket): return ticket
        case .senior(let ticket): return ticket
        }
    }
    
    static func allCases(movie: Movie, sheet: Sheet, schedule: Schedule) -> [TicketType] {
        return [
        .normal(NormalTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .child(ChildTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .shoolStudent(SchoolStudentTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .universityStudent(UniversityStudentTicket(movie: movie, sheet: sheet, schedule: schedule)),
        .senior(SeniorTicket(movie: movie, sheet: sheet, schedule: schedule))
        ]
    }
}

protocol Ticket {
    var movie: Movie { get }
    var charge: Charge { get }
    var sheet: Sheet { get }
    var schedule: Schedule { get }
}

struct TicketTypeCollection {
    let sheet: Sheet
    let ticketTypess: [TicketType]
    
    init(sheet: Sheet, movie: Movie, schedule: Schedule) {
        self.sheet = sheet
        ticketTypess = TicketType.allCases(movie: movie, sheet: sheet, schedule: schedule)
    }
}

struct NormalTicket: Ticket {
    let charge = Charge(value: 1900)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct ChildTicket: Ticket {
    let charge = Charge(value: 1000)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct SchoolStudentTicket: Ticket {
    let charge = Charge(value: 1200)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct UniversityStudentTicket: Ticket {
    let charge = Charge(value: 1500)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}

struct SeniorTicket: Ticket {
    let charge = Charge(value: 1200)
    let movie: Movie
    let sheet: Sheet
    let schedule: Schedule
}
