//
//  ContentView.swift
//  SnakeJSONApp
//
//  Created by Ege Sucu on 19.01.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userManager = UserManager()
    @State private var name = ""
    @State private var user : User? = nil
    @State private var errorMessage = ""
    
    var body: some View {
        VStack(spacing: 10){
            Text("Enter User Name")
                .font(.title)
                .padding()
            TextField("Enter", text: $name)
                .multilineTextAlignment(.center)
                .onSubmit(fetchUserDetail)
                .padding()
            
            if let user = user {
                Text("Name").font(.title2)
                    .foregroundColor(.blue)
                    .padding([.leading,.trailing])
                Text(user.userName)
                Text("Age").font(.title2)
                    .foregroundColor(.red)
                    .padding([.leading,.trailing])
                Text("\(user.userAge)")
                Text("Hobbies").font(.title2)
                    .foregroundColor(.green)
                    .padding([.leading,.trailing])
                ScrollView(.horizontal){
                    HStack(alignment: .center) {
                        ForEach(user.userHobbies, id: \.self) { hobby in
                            Text(hobby)
                                .padding()
                        }
                    }
                }
                Text("Known Languages").font(.title2)
                    .foregroundColor(.cyan)
                    .padding([.leading,.trailing])
                ScrollView(.horizontal){
                    HStack(alignment: .center) {
                        ForEach(user.userLanguages, id: \.self) { language in
                            Text(language)
                                .padding()
                        }
                    }
                }
            } else {
                Text(errorMessage)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
        }.onAppear(perform: userManager.fetchUsers)
    }
    
    func fetchUserDetail(){
        userManager.fetchUserDetail(with: name.capitalized) { result in
            switch result{
            case .success(let user):
                self.user = user
                self.errorMessage = ""
            case .failure(let error):
                self.user = nil
                self.errorMessage = error.rawValue
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
