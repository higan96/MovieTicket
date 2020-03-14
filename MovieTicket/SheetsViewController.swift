//
//  SheetsViewController.swift
//  MovieTicket
//
//  Created by Norihiko Oba on 2020/03/14.
//  Copyright © 2020 Norihiko Oba. All rights reserved.
//

import UIKit

class SheetsViewController: UIViewController {
    
    static func instantiate(program: Program) -> SheetsViewController {
        let vc = SheetsViewController.instantiate()
        vc.program = program
        return vc
    }
    
    @IBOutlet private var tableView: UITableView!
    private var program: Program!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SheetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sheet = program.theater.sheets[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SheetCell", for: indexPath)
        cell.textLabel?.text = sheet.label
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return program.theater.sheets.count
    }
}
