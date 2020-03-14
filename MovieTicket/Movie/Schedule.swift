//
//  Schedule.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

struct Schedule {
    let startAt: Date
    let endAt: Date
    var dateLabel: String {
        let formatter = self.formatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter.string(from: startAt)
    }
    
    var startAtLabel: String {
        let formatter = self.formatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return "\(formatter.string(from: startAt))"
    }
    
    var startToEndTimeLabel: String {
        let formatter = self.formatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return "\(formatter.string(from: startAt)) - \(formatter.string(from: endAt))"
    }
    
    private func formatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja-JP")
        return formatter
    }
}
