//  Created by Kseniya Kovgorenya on 25.03.24.

import UIKit

class CatsViewController: UIViewController {
    
    var cats: [CatViewModel]?
    
    let catsView = CatsView()
    let catsService = CatService()
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        view.addSubview(catsView)
        catsView.frame = view.bounds
        
        catsService.obtainCats { catsResponse in
            if let cats = catsResponse {
                self.cats = cats
                self.tableview.reloadData()
            }
            print(catsResponse ?? "No cats")
        }
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func setupViews() {
        view.addSubview(tableview)
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension CatsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

