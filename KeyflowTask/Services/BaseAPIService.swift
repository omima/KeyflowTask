//
//  BaseAPIService.swift
//  KeyflowTask
//
//  Created by Omima Ibrahim on 25/01/2021.
//

import Foundation
import Alamofire

class BaseAPIService {
    
    public enum HTTPMethod : String{
        case get = "GET"
        case post = "POST"
    }
    
    fileprivate func getFullUrl(for endPoint: Endpoint) -> String {
          return "\(endPoint.base)\(endPoint.path)"
      }
    
    func execute<Model: Codable>(endPoint: Endpoint, method:BaseAPIService.HTTPMethod = .get, parameters:[String:Any] = [:],completionHandler: @escaping (Swift.Result<Model, Error>) -> Void) {
    
        if !isConnected() {
            completionHandler(Swift.Result.failure(BaseAPIServiceError.networkError))
        }
        let endpointUrl = getFullUrl(for: endPoint)
        AF.request(endpointUrl, method: Alamofire.HTTPMethod.init(rawValue: method.rawValue), parameters: parameters, headers: nil).responseData { (response) in
              switch response.result {
              case .success(let data):
                  do {
                      let object = try JSONDecoder().decode(Model.self, from: data)
                      completionHandler(Swift.Result.success(object))
                  }
                  catch {
                      completionHandler(Swift.Result.failure(BaseAPIServiceError.parsingError))
                  }
              case .failure(let error):
                completionHandler(Swift.Result.failure(BaseAPIServiceError.serverError(message: error.localizedDescription)))
              }
          }
    }
     func isConnected() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
