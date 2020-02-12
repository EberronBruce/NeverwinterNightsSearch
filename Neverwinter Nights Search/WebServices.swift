//
//  WebServices.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/11/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import Foundation

typealias webServiceCompletionHandler = (_ data: Data?, _ error: Error?) -> Void

func getDatafromURL(urlString: String, completionHandler: @escaping webServiceCompletionHandler) {
    guard let url = URL(string: urlString) else { return }
    var request = URLRequest(url: url)
    
    request.httpMethod = HTTP_GET_METHOD
    
    URLSession.shared.dataTask(with: request, completionHandler:  { (data, response, error) -> Void in
        if error != nil {
            print(error?.localizedDescription ?? ERROR_UNKNOWN)
            completionHandler(nil, error!)
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            if data != nil {
                completionHandler(data!,nil)
            } else {
                print(ERROR_NO_DATA)
                completionHandler(nil, nil)
            }
        })
        
    }).resume()
    
}
