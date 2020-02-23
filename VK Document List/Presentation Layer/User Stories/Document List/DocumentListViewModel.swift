//
//  DocumentListViewModel.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation
import VK_ios_sdk

protocol DocumentListViewModelInput {
    func configure(with data: Any?)
}

class DocumentListViewModel {

    // MARK: - Props
    private var documentItems: [DocumentItem]
    private var keychainService: KeychainService
    private var user: User?
    private var loadDataCompletion: (Result<[TableCellModel], DocumentListError>) -> Void = { _ in }
    
    private var offset: Int
    private var allLoaded: Bool
    private var isLoading: Bool
    private let limit: Int = 20
    
    // MARK: - Initialization
    init() {
        documentItems = []
        keychainService = KeychainService()
        offset = 0
        allLoaded = false
        isLoading = false
    }

    // MARK: - Public functions
    public func reloadData(completion: @escaping (Result<[TableCellModel], DocumentListError>) -> Void) {
        user = keychainService.read(key: AppDefaults.Keychain.vkUser)
        offset = 0
        allLoaded = false
        documentItems = []
        
        loadNextData(completion: completion)
    }
    
    public func loadNextData(completion: @escaping (Result<[TableCellModel], DocumentListError>) -> Void) {
        guard !isLoading else {
            completion(.failure(.isLoading))
            return
        }
        guard !allLoaded else {
            completion(.failure(.allLoaded))
            return
        }
        guard let user = user else {
            completion(.failure(.unknown(error: nil)))
            return
        }
        loadDataCompletion = completion
        isLoading = true
        let params: [AnyHashable: Any] = [
            "count": limit,
            "offset": offset,
            "owner_id": user.id
        ]
        let request = VKApi.request(withMethod: "docs.get", andParameters: params)
        request?.execute(resultBlock: loadDataResult, errorBlock: loadDataError)
    }

}

// MARK: - Module functions
extension DocumentListViewModel {
    
    private func loadDataResult(result: VKResponse<VKApiObject>?) {
        guard let data = result?.responseString?.data(using: .utf8),
            let response = try? JSONDecoder().decode(DocumentListResponse.self, from: data) else {
            loadDataCompletion(.failure(.unknown(error: nil)))
            return
        }
        let items = response.getDocumentItems()
        offset += items.count
        documentItems.append(contentsOf: items)
        
        makeCellModels()
    }
    
    private func loadDataError(error: Error?) {
        loadDataCompletion(.failure(.unknown(error: error)))
    }
    
    private func makeCellModels(scrollToTop: Bool = false) {
        var models: [TableCellModel] = []
        
        // TODO: - Add sorting
        let items = documentItems
        items.forEach({ models.append(DocumentItemCellModel($0)) })
        
        loadDataCompletion(.success(models))
    }
    
}

// MARK: - DocumentListViewModelInput
extension DocumentListViewModel: DocumentListViewModelInput {

    func configure(with data: Any?) { }

}
