//
//  calısma.swift
//  TemelBilesenler
//
//  Created by ceksi on 7.09.2023.
//

import Foundation

func loadData () {
    
    var myArray = [String]() // Boş array oluşturmak
    
    // Array'a yeni eleman eklemek için
    myArray.append("Şirin")
    myArray.append("Çağdaş")
    myArray.append("Melis")
    
    // Eklenen elemanları listelemek için
    for item in myArray {
        print(item)
    }
    
    // Array'den belirli bir elemanı çıkarmak için
    var people = ["Şirin", "Çağdaş", "Melis"]
    if let index = people.firstIndex(of: "Çağdaş") {
        people.remove(at: index)
    }
    print("Kişi Çıkarıldı")
    for item in people {
        print(item)
    }
    
    // Array'a birden fazla eleman eklemek için
    var newPeople = ["Şirin", "Melis", "Çağdaş"]
     newPeople += ["Şermin", "Ayşe"]
    
    print("Kişiler eklendi")
    for person in newPeople {
        print(person)
        
    }
    
    // Dizideki elemanları sıralamak için
    
    var fruits = ["Orange", "Apple", "Banana", "Watermelon"]
    fruits.sort()
    
    print("Uzunluklarına göre sıralandı")
    for fruit in fruits {
        print(fruit)
    }
    
    //Diziyi belirli bir elemanla doldurmak için
    var filledArray = Array(repeating: "Melis", count: 3)
    
    
    print("Diziye 3 tane Melis eklendi")
    for item in filledArray {
        print(item)
    }
}


func userData () {
    
    struct Person {
        
        var ad: String
        var soyad: String
        var dogumYili: Int
    }
    
    // Boş person dizisi oluşturur
    var people = [Person]()
    
    //Diziye person eklemek için
    let person1 = Person(ad: "Şirin", soyad: "Ekşi", dogumYili: 1992)
    let person2 = Person(ad: "Çağdaş", soyad: "Ekşi", dogumYili: 1988)
    let person3 = Person(ad: "Melis", soyad: "Ekşi", dogumYili: 2019)
    
    people.append(person1)
    people.append(person2)
    people.append(person3)
    
    print("Kişiler eklendi")
    for person in people {
        print("Benim Adım: \(person.ad), soyadım:\(person.soyad), doğumYılım: \(person.dogumYili)")
        
    }
    
    
    let ad = "şiirin"
    let soyad = "ekşi"
    let yas = "30"
    let mesaj = "adım : \(ad), soaydım: \(soyad), yaşımda \(yas) oldu. sorma gitsin."
    
    print(mesaj) // mesaj gonderildi.
    
    let marka = "mercedes"
    let model = "cla180"
    let modelyili = "2015"
    let mesajaraba = "benim arabamın modeli \(model), markası \(marka), model yılıda \(modelyili)"
    
    print(mesajaraba)
    
    let fullName = "\(ad) \(soyad) \(yas)"
    print(fullName)
    
    let sirin = "\(marka) \(model) \(modelyili)"
    print(sirin)
    
}
