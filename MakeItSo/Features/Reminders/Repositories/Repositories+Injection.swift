//
//  Repositories+Injection.swift
//  MakeItSo
//
//  Created by Marcel Mravec on 27.02.2024.
//

import Foundation
import Factory

extension Container {
    public var remindersRepository: Factory<RemindersRepository> {
        self {
            RemindersRepository()
        }.singleton
    }
}
