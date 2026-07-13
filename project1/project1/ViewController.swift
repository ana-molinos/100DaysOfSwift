//
//  ViewController.swift
//  project1
//
//  Created by Ana Julia Molinos Leite Da Silva on 10/07/26.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath! // assets path
        let items = try! fm.contentsOfDirectory(atPath: path) // array of strings containing filenames
        
        for item in items {
            if item.hasPrefix("nssl"){
                self.pictures.append(item)
            }
        }
        
        print(self.pictures)
        
        title = "Storm View"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Acessa a table view e define qual o tipo e o rótulo das suas células
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Picture")
    }

    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // Gera uma linha com aquela célula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Acessa a table view e pede para desenfileirar uma célula reutilizável com o rótulo "Picture" e colocar na linha com localização "indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
}

