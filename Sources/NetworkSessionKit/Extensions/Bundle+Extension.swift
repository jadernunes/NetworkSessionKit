//
//  Bundle+Extension.swift
//  
//
//  Created by Jader Nunes on 11/07/24.
//

import Foundation

extension Bundle {
    static var currentModule: Bundle {
        Bundle(for: NetworkSession.self)
    }
}
