//
//  SnakeDecoder.swift
//  SnakeJSONApp
//
//  Created by Ege Sucu on 19.01.2022.
//

import Foundation

class SnakeDecoder: JSONDecoder{
    override init() {
        super.init()
        self.keyDecodingStrategy = .convertFromSnakeCase
    }
}
