//
//  ProductView.swift
//  TemelBilesenler
//
//  Created by ceksi on 11.09.2023.
//

import SwiftUI

struct ProductView: View {
    
    @State private var urunler: [Product] = []
    @State private var ürünAdi: String = ""
    @State private var ürünAciklamasi: String = ""
    @State private var ürünFiyati: String = ""
    
    @State private var selectedProduct: Product?
    
    
    var body: some View {
        VStack {
            Text("Ürünler")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.red)
            
            
           TextField("Ürün Adı", text: $ürünAdi)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Ürün Açıklaması", text: $ürünAciklamasi)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Ürün Fiyatı", text: $ürünFiyati)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            
            Button (action: {
                
                if let ürünFiyatiInt = Int(ürünFiyati) {
                    let newProduct = Product(ürünAdi: ürünAdi, ürünAciklamasi: ürünAciklamasi, ürünFiyati: ürünFiyatiInt)
                    urunler.append(newProduct)
                    
                    ürünAdi = ""
                    ürünAciklamasi = ""
                    ürünFiyati = ""
                }
                
                
                
            })  {
                
                Text("Yeni Ürün Ekle")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            List (urunler, id: \.id) {  item in
                HStack {
                    VStack (alignment: .leading)  {
                        Text("Ürün Adı: \(item.ürünAdi)")
                        Text("Ürün Açıklaması: \(item.ürünAciklamasi)")
                        Text("Ürün Fiyatı: \(Int(item.ürünFiyati))")
                        
                        
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button (action: {
                                          
                                            selectedProduct = item
                                            ürünAdi = item.ürünAdi
                                            ürünAciklamasi = item.ürünAciklamasi
                                            ürünFiyati = String(item.ürünFiyati)
                                        }) {
                                            Text("Güncelle")
                                                .bold()
                                                .padding(15)
                                                .background(Color.orange)
                                                .foregroundColor(.white)
                                                .cornerRadius(10)
                                        }

                    
                    
                    
                    
                    Button (action: {
                        if let index = urunler.firstIndex(where: { $0.id == item.id}) {
                            urunler.remove(at: index)
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

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}


struct Product: Identifiable {
    let id = UUID()
    let ürünAdi: String
    let ürünAciklamasi: String
    let ürünFiyati: Int
}
    
