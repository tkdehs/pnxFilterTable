//
//  ViewController.swift
//  pnxFilterTable
//
//  Created by Sangdon Kim on 05/10/2023.
//  Copyright (c) 2023 Sangdon Kim. All rights reserved.
//

import UIKit
import pnxFilterTable

class ViewController: UIViewController, PnxFilterTableDelegate {

    var pnxFilterTable = PnxFilterTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(self.pnxFilterTable)
        self.pnxFilterTable.frame = self.view.frame
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let dataList = [PnxFilterData(title:"과일", datas: [PnxFilterData.Data(display:"사과", value: "1"),
                                                             PnxFilterData.Data(display:"포도", value: "2"),
                                                             PnxFilterData.Data(display:"딸기", value: "3"),
                                                             PnxFilterData.Data(display:"토마토", value: "4"),
                                                             PnxFilterData.Data(display:"배", value: "5"),
                                                             PnxFilterData.Data(display:"파인애플", value: "6"),
                                                             PnxFilterData.Data(display:"망고", value: "7"),
                                                             PnxFilterData.Data(display:"복숭아", value: "8"),
                                                             PnxFilterData.Data(display:"아보카도", value: "9"),
                                                             PnxFilterData.Data(display:"오렌지", value: "10"),
                                                             PnxFilterData.Data(display:"골드키위", value: "11"),
                                                             PnxFilterData.Data(display:"수박", value: "12")]),
                        PnxFilterData(title:"과자", datas: [PnxFilterData.Data(display:"프링글스", value: "1"),
                                                             PnxFilterData.Data(display:"눈을감자", value: "2"),
                                                             PnxFilterData.Data(display:"포테이토 칩스", value: "3"),
                                                            PnxFilterData.Data(display:"포카칩", value: "4")]),
                        PnxFilterData(title:"라면", datas: [PnxFilterData.Data(display:"신라면", value: "1"),
                                                             PnxFilterData.Data(display:"삼양라면", value: "2"),
                                                             PnxFilterData.Data(display:"튀김우동라면", value: "3"),
                                                            PnxFilterData.Data(display:"틈새라면", value: "4")])]
        self.pnxFilterTable.isMultipleSelect = true
        self.pnxFilterTable.dataList = dataList
        self.pnxFilterTable.tableView.separatorStyle = .none
        self.pnxFilterTable.delegate = self
        
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

    func didSelectedButton(selector: UIButton, data: pnxFilterTable.PnxFilterData.Data) {
        print("display : \(data.display)")
        print("value : \(data.value)")
    }
}

