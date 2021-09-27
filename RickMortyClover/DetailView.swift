//
//  DetailView.swift
//  RickMortyClover
//
//  Created by Pallav Agarwal on 9/26/21.
//

import SwiftUI
import Apollo

struct DetailView: View {
    let id: GraphQLID
    
    @State var character: GetCharacterDetailQuery.Data.Character?
    @State var location: GetCharacterDetailQuery.Data.Character.Location?
    @State var noLocation = false
    
    // Fetch Single Character - GraphQL
    private func fetchCharacter() {
        Network.shared.apollo.fetch(query: GetCharacterDetailQuery(id: id)) { result in
            switch result {
            case .success(let graphQLResult):
                character = graphQLResult.data?.character
                location = graphQLResult.data?.character?.location
                noLocation = (location == nil)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    /* Information Box */
    @ViewBuilder func infoBox(title: String, info: String?) -> some View {
        Group {
            Text("\(title)\n").bold().font(.title2) +
            Text("\(info ?? "Unknown")").font(.title3)
        }
        .padding(.horizontal)
        .frame(width: (UIScreen.main.bounds.size.width - 32)/2, height: (UIScreen.main.bounds.size.width - 32)/3)
        .background(Color(UIColor.tertiarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
        .multilineTextAlignment(.center)
    }
    
    /* Main View */
    var body: some View {
        ZStack {
            
            // Background Color
            Color(UIColor.systemGroupedBackground).ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                if (character != nil) && (location != nil || noLocation) {
                    
                    VStack {
                        
                        // Image
                        AsyncImage(url: URL(string: character?.image ?? "")) {
                            $0.resizable()
                        } placeholder: { ProgressView() }
                        .frame(width: 150, height: 150)
                        .cornerRadius(75)
                        .padding()
                        
                        // 'Location' Title Text
                        Text("Location")
                            .fontWeight(.heavy)
                            .font(.system(size: 30))
                            .padding(.bottom, 1)
                            .frame(alignment: .leading)
                        
                        // Location Info Boxes
                        HStack {
                            infoBox(title: "Name", info: location?.name)
                            infoBox(title: "Type", info: location?.type)
                        }
                        
                        HStack {
                            infoBox(title: "Dimension", info: location?.dimension)
                            infoBox(title: "Residents", info: "\(location?.residents.count ?? 0)")
                        }
                        
                    }
                }
            }
            .navigationBarTitle(character?.name ?? "Loading...")
            .onAppear(perform: fetchCharacter)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: GraphQLID(1))
    }
}
