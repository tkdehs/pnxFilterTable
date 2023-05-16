//
//  PnxFilterData.swift
//  pnxFilterTable
//
//  Created by PNX on 2023/05/10.
//

public class PnxFilterData {
    public var title:String = ""
    public var datas:[Data] = []
    public var selectedData:[Data] { datas.filter { $0.isSelected } }
    
    public init(title: String, datas: [Data]) {
        self.title = title
        self.datas = datas
    }
    
    public class Data {
        public var display:String
        public var value:String
        public var isSelected:Bool = false
        
        public init(display: String, value: String) {
            self.display = display
            self.value = value
        }
        
        func reversSelected() {
            self.isSelected = !isSelected
        }
    }
}

