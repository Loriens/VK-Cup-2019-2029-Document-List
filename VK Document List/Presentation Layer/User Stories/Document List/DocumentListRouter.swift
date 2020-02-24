//
//  DocumentListRouter.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

protocol DocumentListRouterInput {
    func pushSafariViewController(with: DocumentItem?)
    func showError(_ error: Error?)
}

class DocumentListRouter: DocumentListRouterInput {
    
    // MARK: - Props
    weak var viewController: DocumentListViewController?
    
    // MARK: - DocumentListRouterInput
    func pushSafariViewController(with documentItem: DocumentItem?) {
        let vc = SafariConfigurator.create()
        let viewModel = SafariConfigurator.configure(with: vc)
        viewModel.configure(with: documentItem)
        
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func showError(_ error: Error?) {
        let alert = UIAlertController(title: "Error".localized, message: error?.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK".localized, style: .cancel)
        alert.addAction(action)
        
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.present(alert, animated: true)
        }
    }
    
    // MARK: - Module functions
}
