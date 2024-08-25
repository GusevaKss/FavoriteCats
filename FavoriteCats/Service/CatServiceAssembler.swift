//  Created by Kseniya Kovgorenya on 25.08.24.

import Foundation

class CatServiceAssembler {
    func createCatService() -> CatService {
        let requestBuilder = CatRequestBuilder()
            .setLimit(10)
        
        return CatService(requestBuilder: requestBuilder)
    }
}
