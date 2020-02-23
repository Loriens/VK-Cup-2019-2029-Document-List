//
//  InitialViewController.swift
//  VK Document List
//
//  Created by Vladislav on 15.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit
import VK_ios_sdk

class InitialViewController: UIViewController {

    // MARK: - Outlets
    
    // MARK: - Props
    var viewModel: InitialViewModel?
    var router: InitialRouterInput?
    
    private var vkSdkInstance = VKSdk.initialize(withAppId: "6955732")
    
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
        
        vkSdkInstance?.register(self)
        vkSdkInstance?.uiDelegate = self
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController { }

// MARK: - VKSdkDelegate
extension InitialViewController: VKSdkDelegate {
    
    func vkSdkUserAuthorizationFailed() {
        print("Error: VK Auth failed")
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        guard result != nil else { return }
        viewModel?.auth(completion: { (error) in
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return
            }
            print("VK Auth is OK")
        })
    }
    
    func vkSdkAccessAuthorizationFinishedWithResult(result: VKAuthorizationResult?) {
        print("VK Result")
    }
    
}

// MARK: - VKSdkUIDelegate
extension InitialViewController: VKSdkUIDelegate {
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        self.present(controller, animated: true, completion: nil)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("VKSdk need captcha")
    }
    
}
