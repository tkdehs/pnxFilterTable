//
//  PnxFilterTableViewCell.swift
//  pnxFilterTable
//
//  Created by PNX on 2023/05/10.
//

import UIKit

class PnxFilterTableViewCell: UITableViewCell {
    
    var data: PnxFilterData?

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
    var selectedBackgroundColor:UIColor = UIColor(red: 0.208, green: 0.710, blue: 1.000, alpha: 1.000)
    
    /// 다중 선택 가능여부
    var isMultipleSelect:Bool = false
    
    var horizontalSpacing:CGFloat = 5
    var verticalSpacing:CGFloat = 5
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func initView() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.filterView)
        self.selectionStyle = .none
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.filterView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self.titleLabel,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.titleLabel,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.titleLabel,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: self,
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
                           toItem: self,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.filterView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: self.filterView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: -10.0).isActive = true
        
        
        self.conHeight_filterView = self.filterView.heightAnchor.constraint(equalToConstant: 100)
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
    

    func setCellData(_ data:PnxFilterData) {
        self.initView()
        self.data = data
        self.titleLabel.text = data.title

        let dataArray = data.data

        var positionX:CGFloat = 0
        var positionY:CGFloat = 0
        var defaultHight:CGFloat = 0
        dataArray.forEach { data in
            let button = UIButton()
            button.setTitle(data.display, for: .normal)
            button.setTitleColor(UIColor.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12,weight: .bold)
            button.sizeToFit()
            button.backgroundColor = UIColor(red: 0.208, green: 0.710, blue: 1.000, alpha: 1.000)
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
        }

        self.conHeight_filterView?.constant = positionY + defaultHight
    }
}
