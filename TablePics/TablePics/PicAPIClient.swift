//
//  PicAPIClient.swift
//  TablePics
//
//  Created by Christopher Webb-Orenstein on 8/30/16.
//  Copyright © 2016 Christopher Webb-Orenstein. All rights reserved.
//

import UIKit
import Alamofire


protocol Request {
    var baseURLString: String { get }
    var baseURL: NSURL? { get }
    var method: MethodType { get }
    var URLPath: String { get }
    
}

enum MethodType {
    case GET, POST
    var method: String {
        switch self {
            case GET: return "GET"
            case POST: return "POST"
        }
        
    }
}

struct PicAPIClient: Request {
    var baseURLString: String = "https://johnph75.github.io/flatironVideos/"
    var baseURL: NSURL? = nil
    var method: MethodType = MethodType.GET
    var URLPath: String = "/"
}

extension Request {
    
    func buildRequest() -> NSURLRequest? {
        guard let baseURL = NSURL(string:self.baseURLString + self.URLPath) else { return nil }
        guard let URLComponents = NSURLComponents(URL:baseURL, resolvingAgainstBaseURL: true) else { return nil }
        guard let URL = URLComponents.URL else { return nil }
        let request = NSMutableURLRequest(URL: URL)
        request.HTTPMethod = String(method)
        return request
    }
    
}