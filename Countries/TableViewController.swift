//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Takudzwa Mupanesure on 15/03/2020.
//  Copyright © 2020 Takudzwa Mupanesure. All rights reserved.
//

import UIKit
  
class TableViewController: UITableViewController {

    var styles = Country.learnCountry()
    let identifier: String = "tableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "styleDetail",
            let indexPath = tableView?.indexPathForSelectedRow,
            let destinationViewController: ViewController = segue.destination as? ViewController {
            destinationViewController.style = styles[indexPath.row]
        }
    }

}

extension TableViewController {

    func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationItem.title = "Countries"
        tableView.reloadData()
    }

}

// MARK: - UITableView DataSource

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return styles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell {
            cell.configurateTheCell(styles[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

}

// MARK: - UITableView Delegate

extension TableViewController {
    override func tableView(_ tableView: UITableView, commit editingCountry: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingCountry == .delete {
            styles.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }
}

