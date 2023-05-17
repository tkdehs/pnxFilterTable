
import UIKit

@IBDesignable public class PnxFilterTable: UIView, UITableViewDataSource, UITableViewDelegate {
    
    public var delegate:PnxFilterTableDelegate?
    
    public var titleFont:UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
    
    public var titleFontColor:UIColor = UIColor.black
    
    // MARK: - filter Buttons Setting
    var defaultFont:UIFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    var defaultFontColor:UIColor = UIColor.white
    var defaultBackgroundColor:UIColor = UIColor(red: 0.208, green: 0.710, blue: 1.000, alpha: 1.000)
    
    var selectedFont:UIFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    var selectedFontColor:UIColor = UIColor.white
    var selectedBackgroundColor:UIColor = UIColor(red: 0.227, green: 0.341, blue: 0.604, alpha: 1.000)
    
    /// 다중 선택 가능여부
    public var isMultipleSelect:Bool = false {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    public var horizontalSpacing:CGFloat = 5 {
        didSet {
            self.tableView.reloadData()
        }
    }
    public var verticalSpacing:CGFloat = 5 {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    public var dataList:[PnxFilterData] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    public let tableView:UITableView = UITableView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    private func initView() {
        self.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.alwaysBounceVertical = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        self.tableView.register(PnxFilterTableViewCell.self, forCellReuseIdentifier: "PnxFilterTableViewCell")
    }
    
    public func setDefaultButtonStryle(font:UIFont? = nil, fontColor:UIColor? = nil, backgroundColor:UIColor? = nil){
        if let font = font {
            self.defaultFont = font
        }
        if let fontColor = fontColor {
            self.defaultFontColor = fontColor
        }
        if let backgroundColor = backgroundColor {
            self.defaultBackgroundColor = backgroundColor
        }
        self.tableView.reloadData()
    }
    
    public func setSelectedButtonStryle(fontColor:UIColor? = nil, backgroundColor:UIColor? = nil){
        if let fontColor = fontColor {
            self.selectedFontColor = fontColor
        }
        if let backgroundColor = backgroundColor {
            self.selectedBackgroundColor = backgroundColor
        }
        self.tableView.reloadData()
    }
    
    //============================================================
    // MARK: - UITableViewDelegate, UITableViewDataSource
    //============================================================
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data: PnxFilterData = self.dataList[indexPath.row]
        /// 테이블뷰 세팅
        guard let cell: PnxFilterTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PnxFilterTableViewCell") as? PnxFilterTableViewCell else { return UITableViewCell() }
        cell.setCellData(data,rootView: self)
        
        return cell
    }
}

public protocol PnxFilterTableDelegate {
    func didSelectedButton(selector:UIButton, data:PnxFilterData.Data)
}
