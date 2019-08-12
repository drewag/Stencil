//
//  File.swift
//  Stencil
//
//  Created by Andrew J Wagner on 8/10/19.
//


public protocol DynamicStringReferencable {
    subscript(_ key: String) -> Any? {get}
}
