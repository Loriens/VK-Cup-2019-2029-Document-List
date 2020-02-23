//
//  DocumentListConfigurator.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

enum DocumentListConfigurator {
    
    // Create and return controller
    static func create() -> DocumentListViewController {
        return DocumentListViewController(nibName: DocumentListViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return view model input
    static func configure(with reference: DocumentListViewController) -> DocumentListViewModelInput {
        let viewModel = DocumentListViewModel()
        
        let router = DocumentListRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
