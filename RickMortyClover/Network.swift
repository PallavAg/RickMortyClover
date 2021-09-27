//
//  Network.swift
//  RickMortyClover
//
//  Created by Pallav Agarwal on 9/26/21.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
