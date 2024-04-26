//  Created by Kseniya Kovgorenya on 25.03.24.

import UIKit

class CatsViewController: UIViewController{

    let catsView = CatsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(catsView)
        catsView.frame = view.bounds
    }
}
