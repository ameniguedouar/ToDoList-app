//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 16.08.23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vieModel = ProfileViewModel()
    var body: some View {
        
        NavigationView {
            VStack {
                if let user = vieModel.user {
                    profile(user: user)
                }
                else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            vieModel.fetchUser()
        }
    }
        @ViewBuilder
        func profile(user: User) -> some View {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                .padding()
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack {
                    Text("Memeber since: ")
                        .bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                .padding()
            }
            .padding()
            Button("Log out") {
                vieModel.logOut()
            }
            .tint(.red)
            .padding()
            Spacer()
        }
        }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
