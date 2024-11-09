//
//  PersonDetailView.swift
//  Amigos
//
//  Created by Bibek Bhujel on 07/11/2024.
//

import SwiftUI

struct PersonDetailView: View {
    let person: Person
    var body: some View {
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
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    ZStack {
                        Color(.black.opacity(0.1))
                        VStack {
                            Text(person.name)
                                .font(.largeTitle.bold())
                            Text(person.address)
                                .font(.title2.bold())
                            Text(person.company)
                            Text(person.email)
                                .lineLimit(1)
                            Text("\(person.age) years old 🧑‍🦳")
                                .font(.caption)
                        }.padding()
                    }.frame(maxWidth: .infinity)
                        .clipShape(.rect(cornerRadius:10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white)
                        ).padding()

                    HStack {
                        ZStack {
                            Color(.black.opacity(0.1))
                            Text(person.about)
                                .font(.headline)
                                .padding()
                        }
                    }.frame(maxWidth: .infinity)
                        .clipShape(.rect(cornerRadius:10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white)
                        ).padding()


                    ZStack {
                        Color(.black.opacity(0.2))
                        VStack {
                            Text("Friends")
                                .font(.title.bold())
                            ForEach(person.friends, id: \.id) { friend in
                                HStack {
                                    Text(friend.name)
                                        .font(.largeTitle)
                                        .padding(8)
                                }.frame(maxWidth: .infinity)
                                    .clipShape(.rect(cornerRadius:10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.white)
                                    ).padding()
                            }
                        }.padding()
                    }
                }
            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    let person = Person(
        id: "12345", // Example string identifier
        isActive: true,
        name: "John Doe",
        age: 30,
        company: "Tech Innovations",
        email: "john.doe@example.com",
        address: "123 Main St, Springfield, USA",
        about: "A passionate software developer who loves coding and technology.",
        registered: "2023-01-15T12:34:56Z", // ISO 8601 date format
        tags: ["developer", "swift", "ios"],
        friends: [
            Friend(id: "67890", name: "Sandesh Ranabhat"),// Friend 1
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "54321", name: "Sanjina Bhujel"), // Friend 2
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
            Friend(id: "09876", name: "Mokshada Bhujel"),  // Friend 3
        ]
    )

    PersonDetailView(person: person)
}
