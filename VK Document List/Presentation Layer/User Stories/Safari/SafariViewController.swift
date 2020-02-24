//
//  SafariViewController.swift
//  VK Document List
//
//  Created by Vladislav on 24.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit
import WebKit

class SafariViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var wrapperView: UIView!
    
    // MARK: - Props
    var viewModel: SafariViewModel?
    var router: SafariRouterInput?
    
    private lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: wrapperView.frame, configuration: webConfiguration)
        webView.uiDelegate = self
        return webView
    }()
    
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
extension SafariViewController {
    
    func setupComponents() {
        navigationItem.title = "".localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        view.addSubview(webView)
        if let documentItem = viewModel?.documentItem {
            navigationItem.title = documentItem.title
            guard let url = URL(string: documentItem.url) else { return }
            webView.load(URLRequest(url: url))
        }
    }
    
    func setupActions() { }
    
    func applyStyles() {
        view.apply(.statusBarStyle(color: .white))
    }
    
}

// MARK: - Actions
extension SafariViewController { }

// MARK: - Module functions
extension SafariViewController { }

// MARK: - WKUIDelegate
extension SafariViewController: WKUIDelegate { }
