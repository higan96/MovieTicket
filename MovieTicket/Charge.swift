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
    
    init(value: Int) {
        guard  value > 0 else { fatalError() }
        self.value = value
    }
}
