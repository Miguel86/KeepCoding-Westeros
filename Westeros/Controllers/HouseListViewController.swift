//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 18/2/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

let HOUSE_KEY = "HouseDidChange"
let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseKey"
let LAST_HOUSE = "LAST_HOUSE"

protocol HouseListViewControllerDelegate : class{
    // should, will, did
    //Con el símbolo anonimo se permite llamar a esta función sin pasarle el nombre externo del primer parámetro.
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House)
}

class HouseListViewController: UITableViewController {
    // MARK: - Properties
    let model: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
    // MARK - Initialization
    init(model: [House]){
        self.model = model
        super.init(style: UITableViewStyle.plain)
        
        self.navigationItem.title = "Houses"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath = IndexPath(row: lastRow, section: 0)
        
        tableView.selectRow(at: indexPath, animated: true, scrollPosition: .top)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"

        //Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if(cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        //Sincronizar house (modelo) con cell (vista)
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    

    // MARK: - Table View Delegate
    //should, will, did
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averiguar que casa han pinchado
        let house  = model[indexPath.row]
        
        /*//Crea un controlador de detalle de esa casa
        let houseDetailViewController = HouseDetailViewController(model: house)
        
         //Opción 1
        //Hacer un push
        navigationController?.pushViewController(houseDetailViewController, animated: true)*/
        //Opción 2 con delegados
        //delegate?.houseListViewController(self, didSelectHouse: house)
        
        //Opción 3 con notificacion
        
        //Si estamos en un iphone hago push, sino la vista esta sin inicializar y rompe el syncModelWithView()
        if let _ = delegate as? UIViewController {
            if UIDevice.current.userInterfaceIdiom == .phone {
                // Crear un controlador de detalle de esa casa
                let houseDetailViewController = HouseDetailViewController(model: house)
                
                // Hacer un push
                navigationController?.pushViewController(houseDetailViewController, animated: true)
            }
        }
        
        // Aviso al delegado
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        let notificationCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo:[HOUSE_KEY: house])
        
        notificationCenter.post(notification)
        
        //Guardar las coordenadas de la última casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListViewController{
    func saveLastSelectedHouse(at row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: LAST_HOUSE)
        //Por si las moscas forzamos el guardado
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House{
        //Extraer la row del UserDetaults
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        
        //Averigar la casa de ese row
        let house = model[row]
        
        //Devolverla
        return house
    }
}
