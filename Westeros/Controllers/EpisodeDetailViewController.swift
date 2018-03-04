//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 1/3/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    @IBOutlet weak var episodeTitle: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var episodeSummary: UITextView!
    
    // Mark: - Properties
    var model: Episode
    
    // Mark: - Initialization
    init(model: Episode) {
        // Primero, limpias tu propio desorder
        self.model = model
        // Llamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = model.title
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
        episodeTitle.text = model.title
        episodeSummary.text = model.summary
        episodeImage.image = model.image
    }

}
