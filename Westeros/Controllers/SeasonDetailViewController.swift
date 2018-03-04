//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Miguel Dos Santos Carregal on 1/3/18.
//  Copyright © 2018 Miguel. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {
    // Mark: - Outlets
    @IBOutlet weak var seasonName: UILabel!
    @IBOutlet weak var seasonImage: UIImageView!
    @IBOutlet weak var seasonPlot: UITextView!
    
    // Mark: - Properties
    var model: Season
    
    // Mark: - Initialization
    init(model: Season) {
        // Primero, limpias tu propio desorden
        self.model = model
        // Llamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))

    }
    
    // Chapuza de los de Cupertino relacionada con los nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        guard let _ = self.view else {
            return
        }
        
        // Model -> View
        seasonName.text = self.model.name
        seasonPlot.text = self.model.plot
        seasonImage.image = self.model.image
        self.navigationItem.title = self.model.name
    }
    
    // MARK: - UI
    func setupUI(){
        let episodesButton = UIBarButtonItem(title: "\(model.sortedEpisodes.count) Episodes", style: .plain, target: self, action: #selector(displayEpisodes))
        
        navigationItem.rightBarButtonItems = [episodesButton]
        
    }
    
    @objc func displayEpisodes(){
        let episodeListViewController = EpisodeListViewController(model: model.sortedEpisodes)
        self.navigationController?.pushViewController(episodeListViewController, animated: true)
    }
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.model = season
        syncModelWithView()
    }
    
    
}
