//
//  MovieView.swift
//  TemelBilesenler
//
//  Created by ceksi on 12.09.2023.
//

import SwiftUI

struct MovieView: View {
    
    @State private var movies: [Movie] = []
    @State private var tf_movieName: String = ""
    @State private var tf_movieDescription: String = ""
    @State private var tf_movieDate: String = ""
    @State private var tf_ibdbScore: String = ""
    @State private var selectedMovie: Movie?
    
    func clear () {
        tf_movieName = ""
        tf_movieDescription = ""
        tf_movieDate = ""
        tf_ibdbScore = ""
        
        print("Tf ler temizlendi")
        
    }
    
    
    var body: some View {
        VStack {
            
            Text("Filmler")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.red)
            
            TextField("Film Adı", text: $tf_movieName )
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Film Açıklaması", text: $tf_movieDescription )
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Film Yayınlanma Tarihi", text: $tf_movieDate)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("İmdb Puanı", text: $tf_ibdbScore)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            Button (action: {
                
                if let filmYili = Int(tf_movieDate), let  imdbPuani  =  Int(tf_ibdbScore){
                    let newMovie = Movie(movieName: tf_movieName, movieDescription: tf_movieDescription, movieDate: filmYili, imdbScore: imdbPuani)
                    movies.append(newMovie)
                    
                    print("Film eklendi")
                    
                   
                }
                
                
                
            })  {
                
                Text("Yeni Film Ekle")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            
            List (movies,  id: \.id ) { item in
                HStack{
                    VStack (alignment: .leading) {
                        Text("Film Adı: \(item.movieName)")
                        Text("Film Açıklaması: \(item.movieDescription)")
                        Text("Film Yayınlanma Tarihi: \(item.movieDate)")
                        Text("İmdb Puanı: \(item.imdbScore)")
                        
                    }
                    .padding()
                    Spacer()
                    
                    Button (action: {
                                          
                        selectedMovie = item
                        tf_movieName = item.movieName
                        tf_movieDescription = item.movieDescription
                        tf_movieDate = String(item.movieDate)
                        tf_ibdbScore = String(item.imdbScore)
                          
                        print("Veriler güncellendi ")
                    })
                        {
                            Text("Güncelle")
                            .bold()
                            .padding(15)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                                    
                        }

                    
                    
                    
                    
                    Button (action: {
                        if let index = movies.firstIndex(where: { $0.id == item.id}) {
                            
                            let deletedMovie = movies[index]
                            print("Silinecek Movie: \(deletedMovie.movieName)")
                            
                            movies.remove(at: index)
                            
                            print("Film silindi")
                            
                            clear()
                           
                        }
                    })
                    {
                        Text ("sil")
                            .bold()
                            .padding(15)
                            .background(Color.red)
                            .cornerRadius(10)
                        .foregroundColor(.white)                    }
                }
                
            }
            
        }
    }
}



struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}



struct Movie: Identifiable {
    
    let id = UUID()
    let movieName: String
    let movieDescription: String
    let movieDate: Int
    let imdbScore: Int
}
