//
//  ContentView.swift
//  Amigos
//
//  Created by Bibek Bhujel on 06/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [Person]()

    var body: some View {
        VStack {
            List(people, id: \.id) { person in
                Text(person.name)
            }.task {
                if people.isEmpty {
                    await loadData()
                }
            }
        }
        .padding()
    }
    // load data from url

    func loadData() async {
        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? JSONDecoder().decode([Person].self, from: data) {
                people = decodedData
            }
        }catch {
            print("Invalid Data!, Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
