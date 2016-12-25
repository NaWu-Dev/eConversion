//
//  DataModel.swift
//  eTempConversion
//
//  Created by Na Wu on 2016-12-20.
//  Copyright © 2016 Na Wu. All rights reserved.
//

import Foundation

class Temperature {
    
    var temperatureMap : [Int] = []
    var tempArray : [Int] = []
    
    func initTemp(range: Int) {
        for i in 0...range {
            tempArray = [i*10]
            temperatureMap += tempArray
        }
    }
    
    func count() -> Int {
        return temperatureMap.count
    }
    
    func getC(index: Int) -> Int {
        return temperatureMap[index]
    }
    
    func getF(index: Int) -> Double {
        return round((Double(temperatureMap[index])*1.8+32)*10)/10
    }
    
    func calculateC2F (tempC: Double) -> Double {
        return round(Double((tempC*1.8)+32)*10)/10
    }
    
    func calculateF2C (tempF: Double) -> Double {
        return round(Double((tempF-32)*0.5556)*10)/10
    }
    
}
