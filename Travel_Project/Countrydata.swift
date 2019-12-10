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
            let dataTask = self.urlSession.dataTask(with: url! as URL) { (data, response, error) -> Void in
                if error != nil {
                    print(error!)
                } else {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray
                        if jsonResult != nil {
                            let values: NSDictionary? = jsonResult![0] as? NSDictionary
                            let currencies : NSArray = (values!.value(forKey: "currencies") as? NSArray)!
                            self.delegate?.responseDataHandler(data: values!)
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

    
    





