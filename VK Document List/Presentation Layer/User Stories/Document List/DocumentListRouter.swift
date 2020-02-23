//
//  DocumentListRouter.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

protocol DocumentListRouterInput { }

class DocumentListRouter: DocumentListRouterInput {
    
    // MARK: - Props
    weak var viewController: DocumentListViewController?
    
    // MARK: - DocumentListRouterInput
    
    // MARK: - Module functions
}
