//
//  URL+Extension.swift
//  E-Learning
//
//  Created by Nguyen Van Nhat on 1/19/18.
//  Copyright © 2018 COMPANY. All rights reserved.
//

import Foundation

extension URL {
    
    subscript(queryParam: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParam })?.value
    }
    
}
