//
//  ProgramRepository.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

protocol ProgramRepository {
    func programCollections() -> [ProgramCollection]
}

struct ProgramRepositoryMock: ProgramRepository {
    func programCollections() -> [ProgramCollection] {
        let movie = Movie(name: "クレヨンしんちゃん")
        let theater = Theater(name: "シアターA", sheets: sheets(count: 50))
        let shcedule = Schedule(startAt: Date(), endAt: Date())
        let program = Program(movie: movie, theater: theater, schedule: shcedule)
        let collection = ProgramCollection(movie: movie, programs: [program])
        
        return [collection]
    }
    
    func sheets(count: Int) -> [Sheet] {
        let alphabetLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        var sheets: [Sheet] = []
        
        for i in 1...count {
            let alphabet = alphabetLetters[i / 10]
            let sheetLabel = "\(alphabet)-\(String(i))"
            
            let sheet = Sheet(label: sheetLabel, status: .empty)
            sheets.append(sheet)
        }
        
        return sheets
    }
}
