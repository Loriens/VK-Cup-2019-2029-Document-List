//
//  DocumentListViewController.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

class DocumentListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    var viewModel: DocumentListViewModel?
    var router: DocumentListRouterInput?
    
    private var cellModels: [TableCellModel] = []
    
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
extension DocumentListViewController {
    
    func setupComponents() {
        navigationItem.title = "DocumentListTitle".localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellNib(DocumentItemTableCell.self)
        tableView.separatorStyle = .none
        
        viewModel?.reloadData(completion: { [weak self] (result) in
            self?.loadDataResult(result)
        })
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension DocumentListViewController { }

// MARK: - Module functions
extension DocumentListViewController {
    
    private func loadDataResult(_ result: Result<[TableCellModel], DocumentListError>) {
        switch result {
        case let .success(cellModels):
            self.cellModels = cellModels
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case let .failure(error):
            switch error {
            case let .unknown(error):
                router?.showError(error)
            default:
                break
            }
        }
    }
    
}

// MARK: - UITableViewDataSource
extension DocumentListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cellModels[indexPath.row]
        
        if model is DocumentItemCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? DocumentItemTableCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellModels[indexPath.row].cellHeight
    }
    
}

// MARK: - UITableViewDelegate
extension DocumentListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = cellModels[indexPath.row] as? DocumentItemCellModel else { return }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging
            && !cellModels.isEmpty
            && indexPath.row == cellModels.count - 1 {
            viewModel?.loadNextData(completion: { [weak self] (result) in
                self?.loadDataResult(result)
            })
        }
    }
    
}
