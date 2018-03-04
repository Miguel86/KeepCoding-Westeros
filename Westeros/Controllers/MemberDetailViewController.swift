//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 3/3/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var memberDescription: UITextView!
    
    // MARK: - Properties
    var model: Person
    
    // Mark: - Initialization
    init(model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Baja notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    
    func syncModelWithView() {
        memberName.text = model.fullName
        memberDescription.text = "Casa: \(model.house.name)"
    }
    
    @objc func houseDidChange(notification: Notification) {
        guard let info = notification.userInfo else {
            return
        }
        let house = info[HOUSE_KEY] as? House //as es un casting de java
        //Actualizar el modelo
        guard let model = house else { return }//En caso no sea nil model vale eso si no return
        self.model = model.sortedMembers.first!
        //Sincronizar la vista
        syncModelWithView()
    }
}
