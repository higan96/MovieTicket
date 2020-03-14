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
        let movies = self.movies()
        return movies.map { ProgramCollection(movie: $0, programs: self.progras(movie: $0)) }
    }
    
    func sheets(count: Int) -> [Sheet] {
        var sheets: [Sheet] = []
        
        for i in 0...count {
            let sheet = Sheet(label: i.toSheetLabel(), status: .empty)
            sheets.append(sheet)
        }
        
        return sheets
    }
    
    func progras(movie: Movie) -> [Program] {
        var programs: [Program] = []
        
        let theaters = self.theaters(count: 10)
        for _ in 0...5 {
            let program = Program(movie: movie, theater: theaters.randomElement()!, schedule: Schedule(startAt: Date(), endAt: Date()))
            programs.append(program)
        }
        
        return programs
    }
    
    func movies() -> [Movie] {
        return [
            Movie(name: "StarWars episode1"),
            Movie(name: "StarWars episode2"),
            Movie(name: "StarWars episode3"),
            Movie(name: "StarWars episode4"),
            Movie(name: "StarWars episode5"),
            Movie(name: "StarWars episode6"),
            Movie(name: "StarWars episode7"),
            Movie(name: "StarWars episode8"),
            Movie(name: "StarWars episode9"),
            Movie(name: "クレヨンしんちゃん"),
            Movie(name: "かいけつゾロリ"),
            Movie(name: "忍たま乱太郎"),
        ]
    }
    
    func theaters(count: Int) -> [Theater] {
        var theaters: [Theater] = []
        
        for i in 0...count {
            let name = "シアター\(i + 1)"
            let theater = Theater(name: name , sheets: sheets(count: 50))
            theaters.append(theater)
        }
        
        return theaters
    }
}

private extension Int {
    func toSheetLabel() -> String {
        let alphabetLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        let alphabet = alphabetLetters[self / 10]
        let number = self % 10 + 1
        let formattedNumber = number < 10 ? "0" + String(number) : String(number)
        
        return  "\(alphabet)-\(formattedNumber)"
    }
}
