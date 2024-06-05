//  Created by Kseniya Kovgorenya on 25.03.24.

import UIKit

class CatsViewController: UIViewController {
    
    var cats: [CatViewModel]?
    
    let catsService = CatService()
    
    let tableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        catsService.obtainCats { catsResponse in
            if let cats = catsResponse {
                self.cats = cats
                self.tableview.reloadData()
            }
            print(catsResponse ?? "No cats")
        }
    }
    
    func setupViews() {
        view.addSubview(tableview)
        
        tableview.dataSource = self
        tableview.delegate = self
        
        tableview.register(CatCell.self, forCellReuseIdentifier: "catCell")
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "catCell", for: indexPath) as? CatCell else {
            return UITableViewCell()
        }
        if let cat = cats?[indexPath.row] {
            cell.configure(with: cat.url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

