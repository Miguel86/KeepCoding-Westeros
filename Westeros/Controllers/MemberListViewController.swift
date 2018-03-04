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
    var model: [Person]
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Nos damos de baja de las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asignamos delegado
        tableView.delegate = self
        
        //Asignamos datasource
        tableView.dataSource = self
        
    }
    
    // MARK: - Sync
    func syncModelWithView(){
        //title = model.name
    }
    
    // MARK: - Notifications
    @objc func houseDidChange(notification: Notification){
        
        //Extraer el userInfo de la notificación
        //let info = notification.userInfo!
        guard let info = notification.userInfo else {
            return
        }
        
        //Sacar la casa del userInfo
        let house = info[HOUSE_KEY] as? House
        
        //Actualizar el modelo
        guard let model = house else { return }
        self.model = model.sortedMembers
        
        //Sincronizar la vista
        syncModelWithView()
        
        //Recargar los miembros
        tableView.reloadData()
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
        
        //Sincronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        //Devolver la celda
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MemberListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = model[indexPath.row]
        navigationController?.pushViewController(MemberDetailViewController(model: member), animated: true)
    }
}
