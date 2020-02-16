//
//  InitialConfigurator.swift
//  Base Project
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

enum InitialConfigurator {
    
    // Create and return controller
    static func create() -> InitialViewController {
        return InitialViewController(nibName: InitialViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return view model input
    static func configure(with reference: InitialViewController) -> InitialViewModelInput {
        let viewModel = InitialViewModel()
        
        let router = InitialRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
