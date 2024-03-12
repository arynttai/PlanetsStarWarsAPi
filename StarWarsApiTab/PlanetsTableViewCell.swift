import UIKit
import SnapKit

class PlanetsTableViewCell: UITableViewCell {
    
//    let alamofireManager = AlamofireNetworkManager.shared
    
    lazy var name1: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    lazy var diameter1: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    lazy var climate1: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    lazy var population1: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    private func setUp() {
        contentView.backgroundColor = .white
        contentView.addSubview(name1)
        contentView.addSubview(diameter1)
        contentView.addSubview(climate1)
        contentView.addSubview(population1)
        
        setConstraints()
    }
    
    private func setConstraints() {
        name1.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(12)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        diameter1.snp.makeConstraints { make in
            make.top.equalTo(name1.snp.bottom).offset(4)
//            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(12)
        }
        climate1.snp.makeConstraints { make in
            make.top.equalTo(diameter1.snp.bottom).offset(4)
//            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(12)
        }
        population1.snp.makeConstraints { make in
            make.top.equalTo(climate1.snp.bottom).offset(4)
//            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.lessThanOrEqualToSuperview().inset(12) //Нашла в инете. Без этой штуки элементы друг друга перекрывают

        }
    }
    

    func configure() {
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
        

