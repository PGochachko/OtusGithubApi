//
// SearchAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class SearchAPI {
    /**
     Repository List
     
     - parameter q: (query) Query 
     - parameter order: (query) Sort 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func searchReposGet(q: String, order: Order, completion: @escaping ((_ data: RepositoryList?,_ error: Error?) -> Void)) {
        searchReposGetWithRequestBuilder(q: q, order: order).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }

    /**
     Repository List
     - GET /search/repositories
     - parameter q: (query) Query 
     - parameter order: (query) Sort 
     - returns: RequestBuilder<RepositoryList> 
     */
    open class func searchReposGetWithRequestBuilder(q: String, order: Order) -> RequestBuilder<RepositoryList> {
        let path = "/search/repositories"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "q": q.encodeToJSON(), 
            "order": order.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<RepositoryList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
