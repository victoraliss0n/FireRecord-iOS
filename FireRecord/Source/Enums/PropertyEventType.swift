//
//  PropertyEventType.swift
//  FireRecord
//
//  Created by Victor Alisson on 20/10/17.
//
import Foundation
import FirebaseCommunity

public enum PropertyEventType {
    
    case propertyAdded
    case propertyRemoved
    case propertyMoved
    case propertyChanged
    case anyChange
    
    public var rawValue: DataEventType {
        switch self {
            case .propertyAdded:
                return DataEventType.childAdded
            case .propertyRemoved:
                return DataEventType.childRemoved
            case .propertyChanged:
                return DataEventType.childChanged
            case .propertyMoved:
                return DataEventType.childMoved
            case .anyChange:
                return DataEventType.value
        }
    }
}

