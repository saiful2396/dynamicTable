//
//  ViewController.swift
//  dynamicTable
//
//  Created by Saiful Islam on 25/5/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var data = [
        ["First","Second","Third"],
        ["Apple","Banana","Orange","Jack Fruit","Mango"],
        ["Last Item"]
    ]
    
    var Items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.allowsMultipleSelection = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @IBAction func NextButton(){
        Items.removeAll()
        if let selectedRows = tableView.indexPathsForSelectedRows
        {
            for selectItem in selectedRows
            {
                Items.append(data[selectItem.section][selectItem.row])
            }
            
            print("---You have selected---")
            
            for item in Items {
                print(item)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        header.backgroundColor = .systemGray
        
        let label = UILabel(frame: CGRect(x: 10, y: 5,
                                         width: Int(header.frame.size.width) - 15,
                                         height: Int(header.frame.size.height) - 10))
    
        header.addSubview(label)
        header.layer.cornerRadius = 10
        label.text = "Custom section header: \(section)"
        label.font = .systemFont(ofSize: 22, weight: .thin)
        label.textColor = .white
        label.textAlignment = .center
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

}


