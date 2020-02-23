//
//  InitialRouter.swift
//  VK Document List
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

protocol InitialRouterInput {
    func setDocumentListViewController()
}

class InitialRouter: InitialRouterInput {
    
    // MARK: - Props
    weak var viewController: InitialViewController?
    
    // MARK: - InitialRouterInput
    func setDocumentListViewController() {
        let vc = DocumentListConfigurator.create()
        _ = DocumentListConfigurator.configure(with: vc)
        
        DispatchQueue.main.async {
            self.viewController?.navigationController?.setViewControllers([vc], animated: true)
        }
    }
    
    // MARK: - Module functions
}
