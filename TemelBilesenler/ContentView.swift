//
//  ContentView.swift
//  TemelBilesenler
//
//  Created by ceksi on 7.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var  people: [Person1] = []
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var birthYear: String = ""

    
    var body: some View {
        VStack {
         Text ("Kişiler")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.red)
            
            
            TextField("Ad", text: $firstName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("SoyAd", text: $lastName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Doğum Yılı", text: $birthYear)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
           
            
            Button (action: {
                
                if let birthYearInt = Int(birthYear) {
                    let newPerson = Person1(firstName: firstName, lastName: lastName, birthYear: birthYearInt)
                    people.append(newPerson)

                    firstName = ""
                    lastName = ""
                    birthYear = ""



                }
                
            }) {
                Text("Yeni Kişi Ekle")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            
            List(people, id: \.id) { person in
                HStack{
                    VStack(alignment: .leading) {
                        Text("Ad: \(person.firstName)")
                        Text("SoyAd: \(person.lastName)")
                        Text("Doğum Yılı: \(Int(person.birthYear))")
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button (action: {
                        if let index = people.firstIndex(where: { $0.id == person.id }) {
                            people.remove(at: index)
                        }
                    })
                    
                    {
                        Text ("Sil")
                            .bold()                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color.red)
                            .cornerRadius(10)
                            
                    }
                }
                
                
            }
            
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Person1: Identifiable {
    let id = UUID()
    let firstName: String
    let lastName: String
    let birthYear: Int
}
