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
        let theater = Theater(name: "シアターA", sheets: [])
        let shcedule = Schedule(startAt: Date(), endAt: Date())
        let program = Program(movie: movie, theater: theater, schedule: shcedule)
        let collection = ProgramCollection(movie: movie, programs: [program])
        
        return [collection]
    }
}
