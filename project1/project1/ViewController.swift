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
        
        pictures.sort()
        
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
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.selectedImage = pictures[indexPath.row] // passa o nome da imagem selecionado para o detailvc
        vc.totalOfImages = pictures.count
        vc.actualImage = indexPath.row + 1
        navigationController?.pushViewController(vc, animated: true) // empilha a view de detalhes
    }
}

