//  Created by Kseniya Kovgorenya on 25.03.24.

import UIKit

class ViewController: UIViewController{

    let catsView = CatsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }
    
    func setupTableView() {
            view.addSubview(catsView)
        }
    
}
