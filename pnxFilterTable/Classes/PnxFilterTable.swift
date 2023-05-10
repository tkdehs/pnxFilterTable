
import UIKit

@IBDesignable class PnxFilterTable: UIView, UITableViewDataSource, UITableViewDelegate {
    
    
    var dataList:[PnxFilterData] = []
    
    var filterTableView:UITableView = UITableView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    private func initView() {
        self.addSubview(self.filterTableView)
        self.filterTableView.delegate = self
        self.filterTableView.dataSource = self
        self.filterTableView.separatorStyle = .none
        self.filterTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.filterTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.filterTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.filterTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.filterTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    //============================================================
    // MARK: - UITableViewDelegate, UITableViewDataSource
    //============================================================
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data: PnxFilterData = self.dataList[indexPath.row]
        
        /// 테이블뷰 세팅
        guard let cell: PnxFilterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PnxFilterTableViewCell") as? PnxFilterTableViewCell else { return UITableViewCell()}
        cell.setCellData(data)
        
        return cell
    }
}

