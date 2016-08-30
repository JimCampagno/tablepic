//
//  DataStore.swift
//  TablePics
//
//  Created by Christopher Webb-Orenstein on 8/30/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import Foundation

class DataStore {
    var newWebData: [String] = []
    let picAPIRequest = PicAPIClient().buildRequest()! as NSURLRequest
    
    func getDataFromClient(completion:() -> ()) {
        let APIData = DataFromAPI().sendAPIRequest(picAPIRequest) { (webData) in
            self.newWebData = webData
        }
        
    }
    
}