//
//  PnxFilterTableViewCell.swift
//  pnxFilterTable
//
//  Created by PNX on 2023/05/10.
//

import UIKit

public class PnxFilterTableViewCell: UITableViewCell {
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    var filterView: UIView = UIView()
    
    var conHeight_filterView: NSLayoutConstraint?
    
    var cellData:[FilterButtonData] = []
    
    var rootView:PnxFilterTable?
    
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
    }

    func setCellData(_ filterData:PnxFilterData, rootView:PnxFilterTable) {
        self.rootView = rootView
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
                positionY += button.frame.size.height + rootView.verticalSpacing
                button.frame = CGRect.init(x: positionX, y: positionY, width: button.frame.size.width + 20, height: button.frame.size.height )
            } else {
                button.frame = CGRect.init(x: positionX, y: positionY, width: button.frame.size.width + 10, height: button.frame.size.height )
            }
            positionX += button.frame.size.width + rootView.horizontalSpacing
            button.layer.cornerRadius = button.frame.size.height/2
            if defaultHight == 0 { defaultHight = button.frame.size.height }
            button.addTarget {
                if !rootView.isMultipleSelect {
                    self.cellData.filter{ $0.data.isSelected }.forEach { selectedfilterData in
                        selectedfilterData.data.reversSelected()
                        self.setButtonStyle(filterData:selectedfilterData)
                    }
                }
                data.reversSelected()
                self.setButtonStyle(filterData:filterData)
                rootView.delegate?.didSelectedButton(selector: filterData.button, data: filterData.data)
            }
            self.cellData.append(FilterButtonData(button: button, data: data))
        }
        self.conHeight_filterView?.constant = positionY + defaultHight
        
    }
    
    func setButtonStyle(filterData:FilterButtonData){
        guard let rootView = self.rootView else { return }
        filterData.button.titleLabel?.font = rootView.defaultFont
        if filterData.data.isSelected {
            filterData.button.setTitleColor(rootView.selectedFontColor, for: .normal)
            filterData.button.backgroundColor = rootView.selectedBackgroundColor
        } else {
            filterData.button.setTitleColor(rootView.defaultFontColor, for: .normal)
            filterData.button.backgroundColor = rootView.defaultBackgroundColor
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
