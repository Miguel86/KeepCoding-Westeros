//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 12/02/2018.
//  Copyright © 2018 Miguel Dos Santos Carregal. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // Mark: - Properties
    let model: House
    
    // Mark: - Initialization
    init(model: House) {
        // Primero, limpias tu propio desorder
        self.model = model
        // Llamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = model.name
    }
    
    // Chapuza de los de Cupertino relacionada con los nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        // Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }
}
















