//
//  Countrydata.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 11/18/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

protocol CountryDataProtocol {
    func responseDataHandler(data: NSDictionary)
    func responseError(message:String)
    
}

struct Data: Decodable{
    let population: String
    let capital: String
    let languages: String
    let religion: String
    let government: String
    let area: String
    let currency: String
    let gdp: String
}

class Countrydata{
    
    private let urlSession = URLSession.shared
    private let urlPathBase = "https://restcountries.eu/rest/v2/name/"
        
        
    private var dataTask:URLSessionDataTask? = nil

    var delegate:CountryDataProtocol? = nil
        
    init() {}
       
    func getCountry(name: String) {
            
        var urlPath = self.urlPathBase
        var countryName = name.replacingOccurrences(of: " ", with: "")
        var temp = "\(countryName)?fullText=true"
            
        urlPath = urlPath + temp
            
        let url:NSURL? = NSURL(string: urlPath)
            
            //let url = NSURL(string: "https://restcountries.eu/rest/v2/name/\(name)?fullText=true")
            
            let dataTask = self.urlSession.dataTask(with: url! as URL) { (data, response, error) -> Void in
                if error != nil {
                    print(error!)
                } else {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        
         
                        if jsonResult != nil {
                            //let name = jsonResult["name"] as? [[String: Any]]
                                
                            print("WWWWWWWW")
                            //print(jsonResult)
                            let values: NSDictionary? = jsonResult![0] as? NSDictionary
                            let currencies : NSArray = (values!.value(forKey: "currencies") as? NSArray)!
                            
                            if currencies[0] != nil {
                                print("Currencies")
                                print(currencies[0])
                            }
                            else{
                                print("FEJL")
                            }
                            //print(values)
                            self.delegate?.responseDataHandler(data: values!)
                            
                            
                            let names = values?.value(forKey: "name") as? String
                            let capital = values?.value(forKey: "capital")

                            print(names)
                            print(capital)
                            
                            
              
                        }
                        else{
                            print("FFFFFFF")
                        }
                        
                       
                    
                    } catch {
                    }
                }
            }
            dataTask.resume()
        }
    }

    
    





