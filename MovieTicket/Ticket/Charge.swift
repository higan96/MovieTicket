//
//  Charge.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

struct Charge {
    var value: Int
    var label: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "ja-JP")
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    init(value: Int) {
        guard  value > 0 else { fatalError() }
        self.value = value
    }
    
    
}
