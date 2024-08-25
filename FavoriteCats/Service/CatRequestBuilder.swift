//  Created by Kseniya Kovgorenya on 25.08.24.

import Foundation

class CatRequestBuilder {
    
    private var endpoint: String = "https://api.thecatapi.com/v1/images/search"
    private var method: String = "GET"
    private var queryItems: [URLQueryItem] = []
    
    func setLimit(_ limit: Int) -> CatRequestBuilder {
        queryItems.append(URLQueryItem(name: "limit", value: "\(limit)"))
        return self
    }
    
    func build() -> URLRequest? {
        var urlComponents = URLComponents(string: endpoint)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
}
