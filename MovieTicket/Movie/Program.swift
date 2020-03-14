//
//  Program.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import Foundation

struct Program {
    let movie: Movie
    let theater: Theater
    let schedule: Schedule
}

struct ProgramCollection {
    let movie: Movie
    let programs: [Program]
    
    init(movie: Movie, programs: [Program]) {
        guard !Self.containsOtherMovie(movie: movie, programs: programs) else { fatalError() }
        
        self.movie = movie
        self.programs = programs
    }
    
    private static func containsOtherMovie(movie: Movie, programs: [Program]) -> Bool {
        let containedOtherMovie = programs.first(where: { $0.movie.name != movie.name })
        return containedOtherMovie != nil
    }
}
