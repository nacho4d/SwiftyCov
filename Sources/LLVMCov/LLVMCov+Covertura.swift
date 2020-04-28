//
//  File.swift
//  
//
//  Created by Guillermo Ignacio Enriquez Gutierrez on 2020/04/27.
//

import Foundation

extension CodeCov {
    
    public enum AggregateProperty: String, RawRepresentable {
        case lines
        case functions
        case instantiations
    }

    public func fileCoverages(for property: AggregateProperty) -> [String: Coverage] {
        return Dictionary(uniqueKeysWithValues: data
            .first!
            .files
            .map { ($0.filename, $0.summary.coverage(for: property)) }
        )
    }
}

extension CodeCov.File.Summary {
    func coverage(for property: CodeCov.AggregateProperty) -> CodeCov.Coverage {
        switch property {
        case .lines:
            return lines
        case .functions:
            return functions
        case .instantiations:
            return instantiations
        }
    }
}

//: CustomStringConvertible
//
//extension CodeCov.AggregateProperty: CustomStringConvertible {
//    public var description: String {
//        return self.rawValue
//    }
//}
