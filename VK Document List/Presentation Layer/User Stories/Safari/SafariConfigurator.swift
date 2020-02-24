//
//  SafariConfigurator.swift
//  VK Document List
//
//  Created by Vladislav on 24.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

enum SafariConfigurator {
    
    // Create and return controller
    static func create() -> SafariViewController {
        return SafariViewController(nibName: SafariViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return view model input
    static func configure(with reference: SafariViewController) -> SafariViewModelInput {
        let viewModel = SafariViewModel()
        
        let router = SafariRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
