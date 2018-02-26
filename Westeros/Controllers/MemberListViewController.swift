//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 19/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {
    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Mark: - Properties
    let model: [Person]
    //let house: House
    
    // MARK - Initialization
    init(model: [Person]){
        //se podría sacar de house tb
        //self.house = house
        //mode.house: = house.sortedMembers
        
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = "Members"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asignamos delegado
        tableView.delegate = self
        
        //Asignamos datasource
        tableView.dataSource = self
        
    }
}
// MARK: - UITableViewDatasource
extension MemberListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        //Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        //Preguntar por una celda (a una cache) o Crearla
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
                ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        /*if(cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }*/
        
        //Sincronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        //Devolver la celda
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MemberListViewController: UITableViewDelegate{
    
}
