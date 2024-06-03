//  Created by Kseniya Kovgorenya on 25.03.24.

import Alamofire

class CatService{
    let url = "https://api.thecatapi.com/v1/images/search?limit=10"
    
    func obtainCats(completion: @escaping ([CatViewModel]?) -> Void) {
        AF.request(url).responseDecodable(of: [CatViewModel].self) { response in
            print ("log 2")
            switch response.result {
            case .success(let cats):
                completion(cats)
            case .failure(_):
                completion(nil)
            }
        }
        
        print ("log 1")
    }
}
