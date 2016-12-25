//
//  ConversionVC.swift
//  eTempConversion
//
//  Created by Na Wu on 2016-12-20.
//  Copyright © 2016 Na Wu. All rights reserved.
//

import UIKit

class ConversionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfF: UITextField!
    @IBOutlet weak var tfC: UITextField!
    
    var temperature = Temperature()
    
    
    @IBAction func tfCValueChanged(_ sender: UITextField) {
        tfF.text = ""
    }
    
    @IBAction func tfFValueChanged(_ sender: UITextField) {
        tfC.text = ""
    }
    
    @IBAction func tfFEditEnd(_ sender: UITextField) {
        if let tempF = Double(tfF.text!) {
            let tempC = temperature.calculateF2C(tempF: tempF)
            tfC.text = String(tempC)
        }
    }
    
    @IBAction func tfCEditEnd(_ sender: UITextField) {
        if let tempC = Double(tfC.text!) {
            let tempF = temperature.calculateC2F(tempC: tempC)
            tfF.text = String(tempF)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Temperature Conversion"
        tfC.placeholder = "Enter °C"
        tfF.placeholder = "Enter °F"
        
        // Initial temperature map by °C *10
        temperature.initTemp(range: 20)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temperature.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.textLabel!.text = String(temperature.getC(index: indexPath.row))+"  °C"
        cell.detailTextLabel!.text = String(temperature.getF(index: indexPath.row))+"  °F"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "°C                              °F"
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
