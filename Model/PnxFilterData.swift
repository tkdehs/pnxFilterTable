//
//  PnxFilterData.swift
//  pnxFilterTable
//
//  Created by PNX on 2023/05/10.
//

public struct PnxFilterData {
    var title:String = ""
    var data:[Data] = []
    
    public init(title: String, data: [Data]) {
        self.title = title
        self.data = data
    }
    
    public struct Data {
        var display:String
        var value:String
        
        public init(display: String, value: String) {
            self.display = display
            self.value = value
        }
    }
}

