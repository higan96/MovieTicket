//
//  SheetSelector.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

class SheetSelector {
    weak var delegate: SheetSelectorDelegate?
    private(set) var selectedSheets: [Sheet] = []
    
    func isSelected(_ sheet: Sheet) -> Bool {
        return selectedSheets.contains(where: { $0.label == sheet.label })
    }
    
    func select(_ sheet: Sheet) {
        if let index = selectedSheets.firstIndex(where: { $0.label == sheet.label }) {
            selectedSheets.remove(at: index)
        } else {
            selectedSheets.append(sheet)
        }
        delegate?.sheetDidSelect(selectedSheets: selectedSheets)
    }
}

protocol SheetSelectorDelegate: class {
    func sheetDidSelect(selectedSheets: [Sheet])
}
