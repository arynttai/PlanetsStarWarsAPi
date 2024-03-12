import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let alamofireManager = AlamofireNetworkManager.shared
    var results: [Planets] = []
    
    lazy var planetsTableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(PlanetsTableViewCell.self, forCellReuseIdentifier: "PlanetsTableViewCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        fetchData()  
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(planetsTableView)
        setConstraints()
    }
    
    private func setConstraints() {
        planetsTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetsTableViewCell", for: indexPath) as? PlanetsTableViewCell else { return UITableViewCell() }
        
        let planet = results[indexPath.row]
        cell.self.name1.text = planet.name
        cell.self.diameter1.text = planet.diameter
        cell.self.climate1.text = planet.climate
        cell.self.population1.text = planet.population
        
        return cell
    }
    
    func updateData(_ newResults: [Planets]) {
        results = newResults
        planetsTableView.reloadData()
    }
//без fetchData был белый экран. Чат помог
    private func fetchData() {
        alamofireManager.getstarships { [weak self] response in
            guard let results = response?.results else { return }
            self?.updateData(results)
        }
    }
}
