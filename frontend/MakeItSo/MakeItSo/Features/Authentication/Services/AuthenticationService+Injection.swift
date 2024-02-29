//
//  AuthenticationService+Injection.swift
//  MakeItSo
//
//  Created by Marcel Mravec on 29.02.2024.
//

import Foundation
import Factory

extension Container {
    public var authenticationService: Factory<AuthenticationService> {
        self {
            AuthenticationService()
        }
        .singleton
    }
    
}
