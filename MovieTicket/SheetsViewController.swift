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
    
    @IBOutlet private weak var nextButton: UIBarButtonItem!
    @IBOutlet private var tableView: UITableView!
    
    private var program: Program!
    private let sheetSelector = SheetSelector()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "座席の選択"
        sheetSelector.delegate = self
    }
    
    @IBAction func nextButtonDidSelect(_ sender: Any) {
        print(sheetSelector.selectedSheets.count)
    }
}

extension SheetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return program.movie.name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sheet = program.theater.sheets[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SheetCell", for: indexPath)
        cell.textLabel?.text = sheet.label
        cell.accessoryType = sheetSelector.isSelected(sheet) ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return program.theater.sheets.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sheet = program.theater.sheets[indexPath.row]
        sheetSelector.select(sheet)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension SheetsViewController: SheetSelectorDelegate {
    func sheetDidSelect(selectedSheets: [Sheet]) {
        nextButton.isEnabled = !selectedSheets.isEmpty
        nextButton.title = nextButtonTitle(count: selectedSheets.count)
    }
    
    private func nextButtonTitle(count: Int) -> String {
        let baseTitle = "Next"
        let suffix = count > 0 ? "(\(String(count)))" : ""
        return baseTitle + suffix
    }
}
