//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 1/3/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

protocol EpisodeListViewControllerDelegate : class{
    // should, will, did
    //Con el símbolo anonimo se permite llamar a esta función sin pasarle el nombre externo del primer parámetro.
    func EpisodeListViewController(_ vc: EpisodeListViewController, didSelectEpisode Episode: Episode)
}

class EpisodeListViewController: UITableViewController {
    // MARK: - Properties
    var model: [Episode]
    weak var delegate: EpisodeListViewControllerDelegate?
    
    // MARK - Initialization
    init(model: [Episode]){
        self.model = model
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(seasonDidChange), name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Nos damos de baja de las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Episode list"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Notifications
    @objc func seasonDidChange(notification: Notification){
        
        //Extraer el userInfo de la notificación
        //let info = notification.userInfo!
        guard let info = notification.userInfo else {
            return
        }
        
        //Sacar la casa del userInfo
        let season = info[SEASON_KEY] as? Season
        
        //Actualizar el modelo
        guard let model = season else { return }
        self.model = model.sortedEpisodes
        
        //Recargar los miembros
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "EpisodeCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let episode = model[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if(cell == nil){
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        
        //Sincronizar house (modelo) con cell (vista)
        cell?.textLabel?.text = "Title: \(episode.title)"
        cell?.detailTextLabel?.text = "Air date: \(formatter.string(from: episode.airDate))"
        return cell!
    }
    
    // MARK: - Table View Delegate
    //should, will, did
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Averiguar que casa han pinchado
        let episode  = model[indexPath.row]
        
        //Crea un controlador de detalle de esa casa
        let episodeDetailViewController = EpisodeDetailViewController(model: episode)
        
        
        //Hacer un push
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
    }
}
