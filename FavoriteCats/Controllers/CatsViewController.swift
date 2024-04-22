//  Created by Kseniya Kovgorenya on 25.03.24.

import UIKit

class ViewController: UIViewController{

    let tableView = UITableView()
    let data = ["Котик 1", "Котик 2", "Котик 3", "Котик 4", "Котик 5", "Котик 6", "Котик 7", "Котик 8", "Котик 9", "Котик 10"]
    
    let identifire = "myCell" // это что такое вообще и для чего?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = CGRect(x: 10, y: 200, width: 350, height: 600)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 //высота 44 - 44 чего и откуда эта цифра? - высота самой ячейки
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count // это количество ячеек/строк? что оно мне выдаёт столько ячеек, сколько в data  я напишу?
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire) //
        
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
}
