//
//  Sheet.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

enum SheetStatus {
    case empty
    case reserved
}

struct Sheet {
    let label: String
    let status: SheetStatus
}
