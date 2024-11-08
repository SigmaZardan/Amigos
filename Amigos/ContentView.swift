//
//  ContentView.swift
//  Amigos
//
//  Created by Bibek Bhujel on 06/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [Person]()

    var sortedPeople: [Person] {
        people
            .sorted(
                by: { person1, person2 in
                    person1.friends.count > person2.friends.count
                }
            )
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                       gradient: Gradient(colors: [
                           Color(red: 1.0, green: 0.435, blue: 0.380),
                           Color(red: 0.8, green: 0.2, blue: 0.3)
                       ]),
                       startPoint: .top,
                       endPoint: .bottom
                   )
                   .ignoresSafeArea()

                ScrollView {
                    LazyVStack {
                        ForEach(sortedPeople, id: \.id) { person in
                            NavigationLink(value: person, label:{
                                PersonNavigationCardView(person: person)
                            })
                        }
                    }.task {
                        if people.isEmpty {
                            await loadData()
                        }
                    }
                }
            }
            .navigationTitle("Amigos")
            .navigationDestination(for: Person.self) {person in
                PersonDetailView(person: person)
            }
            .preferredColorScheme(.dark)
        }
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
            let decodedData = try JSONDecoder().decode([Person].self, from: data)
            people = decodedData
        }catch {
//            print("Invalid Data!, Error: \(error.localizedDescription)")
            print(String(describing: error))
        }
    }
}



#Preview {
    ContentView()
}
