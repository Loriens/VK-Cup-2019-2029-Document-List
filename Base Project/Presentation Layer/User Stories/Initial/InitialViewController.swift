//
//  InitialViewController.swift
//  Base Project
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Props
    var viewModel: InitialViewModel?
    var router: InitialRouterInput?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        applyStyles()
    }
    
}

// MARK: - Setup functions
extension InitialViewController {
    
    func setupComponents() {
        navigationItem.title = "".localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController { }
