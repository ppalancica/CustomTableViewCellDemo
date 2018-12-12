//
//  ViewController.swift
//  CustomTableViewCellDemo
//
//  Created by Pavel Palancica on 12/12/18.
//  Copyright © 2018 I Dev TV. All rights reserved.
//

import UIKit

struct PatientData {
    var firstName: String
    var lastName: String
    var age: Int
}

class PatientDataCell: UITableViewCell {
    
    var firstNameLabel: UILabel
    var lastNameLabel: UILabel
    var ageLabel: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        var labelFrame = CGRect(x: 20, y: 10, width: UIScreen.main.bounds.size.width - 40, height: 30)
        firstNameLabel = UILabel(frame: labelFrame)
        
        labelFrame.origin = CGPoint(x: 20, y: labelFrame.origin.y + 40)
        lastNameLabel = UILabel(frame: labelFrame)
        
        labelFrame.origin = CGPoint(x: 20, y: labelFrame.origin.y + 40)
        ageLabel = UILabel(frame: labelFrame)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(firstNameLabel)
        contentView.addSubview(ageLabel)
        contentView.addSubview(lastNameLabel)
        contentView.addSubview(ageLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var array: [PatientData] = [
        PatientData(firstName: "Pavel", lastName: "28", age: 28),
        PatientData(firstName: "Andrei", lastName: "31", age: 19),
        PatientData(firstName: "Adelina", lastName: "19", age: 31)
    ]
    
    private lazy var tableView: UITableView = createTableView()
    
    func createTableView() -> UITableView {
        let tableViewOrigin = CGPoint(x: 0, y: 0)
        let tableViewSize = view.bounds.size
        let tableViewFrame = CGRect(origin: tableViewOrigin, size: tableViewSize)
        let tableView = UITableView(frame: tableViewFrame, style: .plain)
        return tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(tableView)
        
        tableView.register(PatientDataCell.self, forCellReuseIdentifier: "PatientDataCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return a cell of type UITableViewCell or another subclass
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientDataCell", for: indexPath) as! PatientDataCell
        
        let item = array[indexPath.row]
        cell.firstNameLabel.text = item.firstName
        cell.lastNameLabel.text = item.lastName
        cell.ageLabel.text = String(item.age)
        
        return cell
    }
    
    // MARK: UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

