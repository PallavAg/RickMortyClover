//
//  ContentView.swift
//  RickMortyClover
//
//  Created by Pallav Agarwal on 9/25/21.
//

import SwiftUI
import Apollo

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var charactersData = [GetCharactersQuery.Data.Character.Result?]()
    @State var nextPage: Int?
    
    private let layout = [GridItem(.adaptive(minimum: 150), spacing: 15)]
    
    // Fetch Characters - GraphQL
    private func fetchCharacters() {
        Network.shared.apollo.fetch(query: GetCharactersQuery(page: nextPage ?? 1)) { result in
            switch result {
            case .success(let graphQLResult):
                charactersData.append(contentsOf: graphQLResult.data?.characters?.results ?? [])
                nextPage = graphQLResult.data?.characters?.info?.next
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    /* Card Item */
    @ViewBuilder func card(for character: GetCharactersQuery.Data.Character.Result) -> some View {
        NavigationLink(destination: DetailView(id: character.id ?? GraphQLID(0))) {
            ZStack {
                
                // Card Background
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color(UIColor.tertiarySystemBackground))
                    .shadow(color: colorScheme == .light ? Color.black.opacity(0.2) : Color.black.opacity(0), radius: 10, x: 10, y: 10)
                    .shadow(color: colorScheme == .light ? Color.white.opacity(0.7) : Color.white.opacity(0), radius: 10, x: -5, y: -5)
                
                VStack {
                    
                    // Profile Image
                    AsyncImage(url: URL(string: character.image ?? "")) {
                        $0.resizable()
                    } placeholder: { ProgressView() }
                    .frame(width: 80, height: 80)
                    .cornerRadius(40)
                    .padding([.trailing], 6)
                    
                    // Name
                    Text(character.name ?? "Unknown Name")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.cyan)
                        .minimumScaleFactor(0.4)
                        .scaledToFit()
                        .frame(height: 25)
                    
                    // Status
                    Text("**Status:** \(character.status ?? "Unknown Status")")
                        .font(.footnote).foregroundColor(.gray)
                        .minimumScaleFactor(0.4)
                        .scaledToFit()
                    
                    // Species
                    Text("**Species:** \(character.species ?? "Unknown Species")")
                        .font(.footnote).foregroundColor(.gray)
                        .minimumScaleFactor(0.4)
                        .scaledToFit()
                    
                }
                .padding(20)
                .multilineTextAlignment(.center)
                
            }
        }
    }
    
    /* Main View */
    var body: some View {
        NavigationView {
            ZStack {
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: layout, spacing: layout[0].spacing) {
                            
                            // Character's Card
                            ForEach (charactersData, id: \.?.id) { character in
                                if let character = character {
                                    card(for: character)
                                }
                            }
                            
                            // Pagination Handler
                            if nextPage != nil {
                                ProgressView().scaleEffect(2).padding().onAppear(perform: fetchCharacters)
                            }
                            
                        }.padding(.horizontal)
                        
                    }
                }
                .navigationTitle("Characters")
                .background(colorScheme == .dark ? Color(UIColor.systemGroupedBackground) : Color.offWhite)
                
                // Loading Indicator for initial load
                if charactersData.isEmpty {
                    ProgressView().scaleEffect(2)
                }
                
            }
            
        }.onAppear(perform: fetchCharacters)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}
