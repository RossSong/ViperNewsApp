//
//  PersistenceError.swift
//  ViperNewsApp
//
//  Created by Сергей Филиппов on 11.04.2018.
//  Copyright © 2018 spacedema. All rights reserved.
//

import Foundation

enum ErrorType: Error {
    
    case managedObjectContextNotFound
    case couldNotSaveObject
    case objectNotFound
}
