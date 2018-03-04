//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 1/3/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

let SEASON_KEY = "SeasibDidChange"
let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonKey"
let LAST_SEASON = "LAST_SEASON"

protocol SeasonListViewControllerDelegate : class{
    // should, will, did
    //Con el símbolo anonimo se permite llamar a esta función sin pasarle el nombre externo del primer parámetro.
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season)
}

class SeasonListViewController: UITableViewController {
    // MARK: - Properties
    let model: [Season]
    weak var delegate: SeasonListViewControllerDelegate?
    
    // MARK - Initialization
    init(model: [Season]){
        self.model = model
        super.init(style: UITableViewStyle.plain)
        
        self.navigationItem.title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*let season = SeasonListViewController(model: Repository.local.seasons).lastSelectedSeason()
        let seasonVC = SeasonDetailViewController(model: season)
        self.delegate = seasonVC
        showDetailViewController(seasonVC.wrappedInNavigation(), sender: nil)*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SeasonCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let season = model[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if(cell == nil){
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        //Sincronizar house (modelo) con cell (vista)
        cell?.textLabel?.text = season.name
        
        return cell!
    }
    
    // MARK: - Table View Delegate
    //should, will, did
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averiguar que casa han pinchado
        let season  = model[indexPath.row]
        
        /*//Crea un controlador de detalle de esa temporada
        let seasonDetailViewController = SeasonDetailViewController(model: season)
         
        //Hacer un push
        navigationController?.pushViewController(seasonDetailViewController, animated: true)*/
        
        //Si estamos en un iphone hago push, sino la vista esta sin inicializar y rompe el syncModelWithView()
        if let _ = delegate as? UIViewController {
            if UIDevice.current.userInterfaceIdiom == .phone {
                //Crea un controlador de detalle de esta temporada
                let seasonDetailViewController = SeasonDetailViewController(model: season)
                
                // Hacer un push
                navigationController?.pushViewController(seasonDetailViewController, animated: true)
            }
        }
        
        //Avisar al delegado
        delegate?.seasonListViewController(self, didSelectSeason: season)
        
        let notificationCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo:[SEASON_KEY: season])
        
        notificationCenter.post(notification)
        
        //Guardar las coordenadas de la última casa seleccionada
        saveLastSelectedSeason(at: indexPath.row)
    }
}

extension SeasonListViewController{
    func saveLastSelectedSeason(at row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: LAST_SEASON)
        //Por si las moscas forzamos el guardado
        defaults.synchronize()
    }
    
    func lastSelectedSeason() -> Season{
        //Extraer la row del UserDetaults
        let row = UserDefaults.standard.integer(forKey: LAST_SEASON)
        
        //Averigar la casa de ese row
        let season = model[row]
        
        //Devolverla
        return season
    }
}
