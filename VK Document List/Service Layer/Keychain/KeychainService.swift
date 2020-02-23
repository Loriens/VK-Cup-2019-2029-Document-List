//
//  KeychainService.swift
//  VK Document List
//
//  Created by Vladislav on 23.02.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

class KeychainService {
    
    // MARK: - Props
    private var service = "markov.vladislav.VKDocumentList"
    
    // MARK: - Public functions
    public func read<T: Codable>(key: String) -> T? {
        var query = keychainQuery(key: key)
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer(&queryResult))
        
        if status != noErr {
            return nil
        }
        
        let jsonDecoder = JSONDecoder()
        guard let item = queryResult as? [String: AnyObject],
            let data = item[kSecValueData as String] as? Data,
            let entity = try? jsonDecoder.decode(T.self, from: data) else {
                return nil
        }
        
        return entity
    }
    
    public func save<T: Codable>(_ entity: T, key: String) -> Bool {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(entity)
        
        if let _: T = read(key: key) {
            var attributesToUpdate = [String: AnyObject]()
            attributesToUpdate[kSecValueData as String] = data as AnyObject
            
            let query = keychainQuery(key: key)
            let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            
            return status == noErr
        }
        
        var query = keychainQuery(key: key)
        query[kSecValueData as String] = data as AnyObject
        let status = SecItemAdd(query as CFDictionary, nil)
        
        return status == noErr
    }
    
    public func remove(key: String) -> Bool {
        let query = keychainQuery(key: key)
        let status = SecItemDelete(query as CFDictionary)
        return status == noErr
    }
    
}

// MARK: - Module functions
extension KeychainService {
    
    private func keychainQuery(key: String) -> [String: AnyObject] {
        var query = [String: AnyObject]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrAccount as String] = key as AnyObject
        query[kSecAttrAccessible as String] = kSecAttrAccessibleWhenUnlocked
        query[kSecAttrService as String] = service as AnyObject
        
        return query
    }
    
}
