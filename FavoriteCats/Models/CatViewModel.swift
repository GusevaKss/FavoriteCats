//  Created by Kseniya Kovgorenya on 25.03.24.

import Foundation

struct CatViewModel: Decodable {
    let id: String
    let url: String
    let name: String?
}

//cat.id
//
//nameTextField.name = cat.name
//
//if let name = cat.name {
//    nameTextField.text = name
//} else {
//    nameTextField.text = "No name"
//}
