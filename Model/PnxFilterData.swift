//
//  PnxFilterData.swift
//  pnxFilterTable
//
//  Created by PNX on 2023/05/10.
//

struct PnxFilterData {
    var title:String = ""
    var data:[Data] = []
    
    struct Data {
        var display:String
        var value:String
    }
}

