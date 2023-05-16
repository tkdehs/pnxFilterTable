//
//  ViewController.swift
//  pnxFilterTable
//
//  Created by Sangdon Kim on 05/10/2023.
//  Copyright (c) 2023 Sangdon Kim. All rights reserved.
//

import UIKit
import pnxFilterTable

class ViewController: UIViewController {

    var pnxFilterTable = PnxFilterTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.pnxFilterTable)
        self.pnxFilterTable.frame = self.view.frame
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dataList = [PnxFilterData(title:"title1", datas: [PnxFilterData.Data(display:"testtest1", value: ""),
                                                             PnxFilterData.Data(display:"testt2", value: ""),
                                                             PnxFilterData.Data(display:"testtestt3", value: ""),
                                                             PnxFilterData.Data(display:"testte4", value: ""),
                                                             PnxFilterData.Data(display:"testte4", value: ""),
                                                             PnxFilterData.Data(display:"testte4", value: ""),
                                                             PnxFilterData.Data(display:"testte4242424242", value: ""),
                                                             PnxFilterData.Data(display:"tes4", value: ""),
                                                             PnxFilterData.Data(display:"tes", value: ""),
                                                             PnxFilterData.Data(display:"testte4", value: ""),
                                                             PnxFilterData.Data(display:"e4", value: ""),
                                                             PnxFilterData.Data(display:"testte4", value: "")]),
                        PnxFilterData(title:"title2", datas: [PnxFilterData.Data(display:"testtest1", value: ""),
                                                             PnxFilterData.Data(display:"testt2", value: ""),
                                                             PnxFilterData.Data(display:"testtestt3", value: ""),
                                                            PnxFilterData.Data(display:"testte4", value: "")])]
        self.pnxFilterTable.isMultipleSelect = true
        self.pnxFilterTable.dataList = dataList
        self.pnxFilterTable.tableView.separatorStyle = .none
        
        let btn = UIButton()
        btn.backgroundColor = UIColor(red: 0.137, green: 0.690, blue: 0.741, alpha: 1.000)
        btn.setTitle("선택 테스트", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(UIColor.white, for: .normal)
        self.view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: btn,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: btn,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: self.view,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: btn,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: self.view.safeAreaLayoutGuide,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: -10).isActive = true
        NSLayoutConstraint.activate([btn.heightAnchor.constraint(equalToConstant: 50)])
        btn.addTarget(self, action: #selector(btnTargetAction), for: .touchUpInside)
    }
    
    @objc func btnTargetAction() {
        pnxFilterTable.dataList.forEach { data in
            print("\(data.title) / selected count : \(data.selectedData.count)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

