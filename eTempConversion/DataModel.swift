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
    
    func getF(index: Int) -> Int {
        return Int(Double(temperatureMap[index])*1.8+32)
    }
    
    func calculateC2F (tempC: Int) -> Int {
        return Int(Double(tempC)*1.8+32)
    }
    
    func calculateF2C (tempF: Int) -> Int {
        return Int(Double(tempF-32)*0.5556)
    }
    
}
