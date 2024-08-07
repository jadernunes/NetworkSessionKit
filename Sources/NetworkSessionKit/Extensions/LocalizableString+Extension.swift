//
//  LocalizableString+Extension.swift
//
//
//  Created by Jader Nunes on 22/06/24.
//

import LocalizeKit

extension LocalizableString {
    
    func localized() -> String {
        localized(bundle: .currentModule)
    }
    
    func localized(_ values: CVarArg...) -> String {
        localized(values, bundle: .currentModule)
    }
}
