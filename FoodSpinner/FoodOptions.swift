//
//  FoodOption.swift
//  FoodSpinner
//
//  Created by Juan-Alejandro Bondad 2019 on 5/7/19.
//  Copyright © 2019 Juan-Alejandro Bondad 2019. All rights reserved.


import UIKit

class FoodOptions: UIViewController {
    //OUTLETS AND VARIABLES
    @IBOutlet weak var tableView: UITableView!
    var userDefaults = UserDefaults.standard
    var options = [String]()
    
    //INITIAL
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var savedOptions = userDefaults.array(forKey: "savedOptions")
        
        if !(options.isEmpty) { //adds saved options from last time
            for option in savedOptions! {
                add((option as! String))
            }
        }
        
    }
    
    @IBAction func onAddTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add a  Option", message: nil, preferredStyle: .alert)
        alert.addTextField { (optionTextField) in
            optionTextField.placeholder = "option"
        }
        let action = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let option = alert.textFields?.first?.text else {return}
            print(option)
            self.add(option)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func add(_ option: String) {
        let index = 0;
        options.insert(option, at: index)
        userDefaults.set(options, forKey: "savedOptions")
        
        let indexPath = IndexPath(row: index, section: 0)
        tableView.insertRows(at: [indexPath], with: .left)
        print(userDefaults.array(forKey: "savedOptions")?.description)
    }
    
}

//EXTENSION
extension FoodOptions: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let option = options[indexPath.row]
        cell.textLabel?.text = option
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        options.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
    }
    
}
