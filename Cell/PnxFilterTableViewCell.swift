//
//  PnxFilterTableViewCell.swift
//  pnxFilterTable
//
//  Created by PNX on 2023/05/10.
//

import UIKit

class PnxFilterTableViewCell: UITableViewCell {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    var filterView: UIView = UIView()
    
    var conHeight_filterView: NSLayoutConstraint?
    
    // MARK: - filter Buttons Setting
    var defaultFont:UIFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    var defaultFontColor:UIColor = UIColor.white
    var defaultBackgroundColor:UIColor = UIColor(red: 0.208, green: 0.710, blue: 1.000, alpha: 1.000)
    
    var selectedFontColor:UIColor = UIColor.white
    var selectedBackgroundColor:UIColor = UIColor(red: 0.227, green: 0.341, blue: 0.604, alpha: 1.000)
    
    /// 다중 선택 가능여부
    var isMultipleSelect:Bool = false
    
    var horizontalSpacing:CGFloat = 5
    var verticalSpacing:CGFloat = 5
    
    var delegate:PnxFilterTableDelegate?
    
    var cellData:[FilterButtonData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func initView() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.filterView)
        self.selectionStyle = .none
        self.isUserInteractionEnabled = true
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.filterView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self.titleLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.titleLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.titleLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 5.0).isActive = true
        NSLayoutConstraint(item: self.filterView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self.titleLabel,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.filterView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.filterView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.filterView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self.contentView,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: -10.0).isActive = true
        
        
        self.conHeight_filterView = self.filterView.heightAnchor.constraint(equalToConstant: 200)
        guard let conHeight_filterView = self.conHeight_filterView else { return }
        NSLayoutConstraint.activate([
            conHeight_filterView
        ])
        print("awakeFromNib init view")
    }
    
    public func setDefaultButtonStryle(font:UIFont?, fontColor:UIColor?, backgroundColor:UIColor?){
        if let font = font {
            self.defaultFont = font
        }
        if let fontColor = fontColor {
            self.defaultFontColor = fontColor
        }
        if let backgroundColor = backgroundColor {
            self.defaultBackgroundColor = backgroundColor
        }
    }
    
    public func setSelectedButtonStryle(fontColor:UIColor?, backgroundColor:UIColor?){
        if let fontColor = fontColor {
            self.selectedFontColor = fontColor
        }
        if let backgroundColor = backgroundColor {
            self.selectedBackgroundColor = backgroundColor
        }
    }
    

    func setCellData(_ filterData:PnxFilterData) {
        self.initView()
        self.cellData = []
        self.titleLabel.text = filterData.title

        var positionX:CGFloat = 0
        var positionY:CGFloat = 0
        var defaultHight:CGFloat = 0
        filterData.datas.forEach { data in
            let button = UIButton()
            let filterData = FilterButtonData(button: button, data: data)
            button.setTitle(data.display, for: .normal)
            self.setButtonStyle(filterData:filterData)
            button.sizeToFit()
            self.filterView.addSubview(button)

            if positionX > self.frame.width {
                positionX = 0
                positionY += button.frame.size.height + self.verticalSpacing
                button.frame = CGRect.init(x: positionX, y: positionY, width: button.frame.size.width + 20, height: button.frame.size.height )
            } else {
                button.frame = CGRect.init(x: positionX, y: positionY, width: button.frame.size.width + 10, height: button.frame.size.height )
            }
            positionX += button.frame.size.width + self.horizontalSpacing
            button.layer.cornerRadius = button.frame.size.height/2
            if defaultHight == 0 { defaultHight = button.frame.size.height }
            button.addTarget {
                if !self.isMultipleSelect {
                    self.cellData.filter{ $0.data.isSelected }.forEach { selectedfilterData in
                        selectedfilterData.data.reversSelected()
                        self.setButtonStyle(filterData:selectedfilterData)
                    }
                }
                data.reversSelected()
                self.setButtonStyle(filterData:filterData)
                self.delegate?.didSelectedButton(selector: filterData.button, data: filterData.data)
            }
            self.cellData.append(FilterButtonData(button: button, data: data))
        }
        self.conHeight_filterView?.constant = positionY + defaultHight
        
    }
    
    func setButtonStyle(filterData:FilterButtonData){
        filterData.button.titleLabel?.font = self.defaultFont
        if filterData.data.isSelected {
            filterData.button.setTitleColor(self.selectedFontColor, for: .normal)
            filterData.button.backgroundColor = self.selectedBackgroundColor
        } else {
            filterData.button.setTitleColor(self.defaultFontColor, for: .normal)
            filterData.button.backgroundColor = self.defaultBackgroundColor
        }
    }
    
    class FilterButtonData {
        var button:UIButton
        var data:PnxFilterData.Data
        
        init(button: UIButton, data: PnxFilterData.Data) {
            self.button = button
            self.data = data
        }
    }
}

extension UIControl {
    
    /// 타겟 추가
    ///
    /// - Parameters:
    ///   - controlEvents: 컨트롤 이벤트
    ///   - action: 액션
    func addTarget (controlEvents: UIControl.Event = .touchUpInside, action: @escaping ()->()) {
        let sleeve = ClosureSleeve(action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, String(format: "[%d]", arc4random()), sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    class ClosureSleeve {
        let closure: ()->()
        
        init (_ closure: @escaping ()->()) {
            self.closure = closure
        }
        
        @objc func invoke () {
            closure()
        }
    }
}
