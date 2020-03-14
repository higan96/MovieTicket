//
//  ProgramsViewController.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import UIKit

class ProgramsViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private var programCollections: [ProgramCollection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let repository = ProgramRepositoryMock()
        self.programCollections = repository.programCollections()
    }
}

extension ProgramsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programCollections[section].programs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramCell", for: indexPath)
        let program = programCollections[indexPath.section].programs[indexPath.row]
        
        cell.textLabel?.text = program.schedule.startAtLabel
        cell.detailTextLabel?.text = program.theater.name
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return programCollections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return programCollections[section].movie.name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let program = programCollections[indexPath.section].programs[indexPath.row]
        let vc = SheetsViewController.instantiate(program: program)
        navigationController?.pushViewController(vc, animated: true)
    }
}
