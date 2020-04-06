//
//  CountriesTableViewController.swift
//  Countries
//
//  Created by Takudzwa Mupanesure on 15/03/2020.
//  Copyright © 2020 Takudzwa Mupanesure. All rights reserved.
//

import Foundation

class Country: Codable {
    let name: String
    let photo: String
    let details: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case photo
        case details
    }
    
    init (name: String, photo:String, details: String) {
        self.name = name
        self.photo = photo
        self.details = details
    }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        photo = try values.decode(String.self, forKey: .photo)
        details = try values.decode(String.self, forKey: .details)
    }
}

extension Country {
    static func oneCountry(name:String, photo:String, details:String) -> Country{
        let styleInformation = Country(name: name, photo: photo, details: details)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(styleInformation) {
            UserDefaults.standard.set(encoded, forKey: "styleInformation")
        }
        if let openCountry = UserDefaults.standard.object(forKey: "styleInformation") as? Data {
            let decoder = JSONDecoder()
            if let readInformation = try? decoder.decode(Country.self, from: openCountry) {
                return Country( name: readInformation.name, photo: readInformation.photo, details: readInformation.details)
            }
        }
        return Country( name: "0", photo: "0", details: "0")
    }
    
    static func learnCountry() -> [Country] {
        var style: [Country] = []
        var information: Country
        information = oneCountry(name: "Zimbabwe", photo: "zw.jpg", details: "Zimbabwe is a landlocked country in southern Africa known for its dramatic landscape and diverse wildlife, much of it within parks, reserves and safari areas.")
        style.append(information)
        information = oneCountry(name: "Australia", photo: "ie.jpg", details: "Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.")
        style.append(information)
        information = oneCountry(name: "Russia", photo: "ru.jpg", details: "Russia, or the Russian Federation, is a transcontinental country located in Eastern Europe and Northern Asia. ")
        style.append(information)
        information = oneCountry(name: "New Zealand", photo: "nz.jpg", details: "New Zealand is a sovereign island country in the southwestern Pacific Ocean.");
        style.append(information)
        information = oneCountry(name: "USA", photo: "us.jpg", details: "The U.S. is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean. ");
        style.append(information)
        information = oneCountry(name: "China", photo: "corona.jpg", details: "Corona Virus.");
            style.append(information)
        information = oneCountry(name: "Kenya", photo: "rw.jpg", details: "Kenya is a country in East Africa with coastline on the Indian Ocean.");
        style.append(information)
        information = oneCountry(name: "South Africa", photo: "sa.jpg", details: "South Africa is a country on the southernmost tip of the African continent, marked by several distinct ecosystems. Inland safari destination Kruger National Park is populated by big game.");
        style.append(information)
        information = oneCountry(name: "Vietnam", photo: "vie.jpg", details: "Vietnam is a Southeast Asian country on the South China Sea known for its beaches, rivers, Buddhist pagodas and bustling cities.");
        style.append(information)
        return style
    }
}
    
    


