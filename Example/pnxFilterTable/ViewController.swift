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
        let dataList = [PnxFilterData(title:"title1", data: [PnxFilterData.Data(display:"testtest1", value: ""),
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
                        PnxFilterData(title:"title2", data: [PnxFilterData.Data(display:"testtest1", value: ""),
                                                             PnxFilterData.Data(display:"testt2", value: ""),
                                                             PnxFilterData.Data(display:"testtestt3", value: ""),
                                                            PnxFilterData.Data(display:"testte4", value: "")])]
        self.pnxFilterTable.dataList = dataList
        self.pnxFilterTable.tableView.separatorStyle = .none
        self.pnxFilterTable.horizontalSpacing = 10
        self.pnxFilterTable.verticalSpacing = 20
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

