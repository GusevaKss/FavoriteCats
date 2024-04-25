//  Created by Kseniya Kovgorenya on 25.03.24.

import UIKit

class CatsView: UIView {
    
    let tableview: UITableView = {
            let tv = UITableView() //тут мы устанавливаем инициализацию только тогда, когда будет вызов
            return tv
        }()
}
