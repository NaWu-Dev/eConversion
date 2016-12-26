//
//  ConversionVC.swift
//  eTempConversion
//
//  Created by Na Wu on 2016-12-20.
//  Copyright © 2016 Na Wu. All rights reserved.
//

import UIKit

class ConversionVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    let defaultTableViewSelected = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tfF: UITextField!
    @IBOutlet weak var tfC: UITextField!
    
    var temperature = Temperature()
    
    @IBAction func tfCEditDidBegin(_ sender: UITextField) {
        moveTextField(textField: sender, moveDistance: -150, up: true)
    }
    
    @IBAction func tfCEditingChanged(_ sender: UITextField) {
        if let tempC = Int(sender.text!) {
            let tempF = temperature.calculateC2F(tempC: tempC)
            tfF.text = String(tempF)
        }
    }
    
    @IBAction func tfCEditEnd(_ sender: UITextField) {
        if let tempC = Int(sender.text!) {
            let tempF = temperature.calculateC2F(tempC: tempC)
            tfF.text = String(tempF)
        }
        moveTextField(textField: sender, moveDistance: -150, up: false)
    }
    
    @IBAction func tfFEditingChanged(_ sender: UITextField) {
        if let tempF = Int(sender.text!) {
            let tempC = temperature.calculateF2C(tempF: tempF)
            tfC.text = String(tempC)
        }
    }
    
    @IBAction func tfFEditDidBegin(_ sender: UITextField) {
        moveTextField(textField: sender, moveDistance: -150, up: true)
    }
    
    @IBAction func tfFEditEnd(_ sender: UITextField) {
        if let tempF = Int(sender.text!) {
            let tempC = temperature.calculateF2C(tempF: tempF)
            tfC.text = String(tempC)
        }
        moveTextField(textField: sender, moveDistance: -150, up: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Temperature Conversion"
        tfC.placeholder = "Enter °C"
        tfF.placeholder = "Enter °F"
        
        // Initial temperature map by °C *10
        let range = 40
        temperature.initTemp(range: range)
        
        let defaultRow = defaultTableViewSelected.integer(forKey: "DefaultTableViewSelected")
        
        let defaultSelectedRow : IndexPath = IndexPath(row: defaultRow, section: 0)
        
        tableView.selectRow(at: defaultSelectedRow, animated: true, scrollPosition: .none)
        
        if defaultRow + 2 > range {
            let defaultSelectedRowNext : IndexPath = IndexPath(row: range, section: 0)
            tableView.scrollToRow(at: defaultSelectedRowNext, at: .none, animated: true)
        } else {
            let defaultSelectedRowNext : IndexPath = IndexPath(row: defaultTableViewSelected.integer(forKey: "DefaultTableViewSelected")+2, section: 0)
            tableView.scrollToRow(at: defaultSelectedRowNext, at: .none, animated: true)
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defaultTableViewSelected.set(indexPath.row, forKey: "DefaultTableViewSelected")
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
        
        cell.textLabel!.text = String(temperature.getC(index: indexPath.row))
        cell.detailTextLabel!.text = String(temperature.getF(index: indexPath.row))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "°C                          °F"
    }
    
    // Scroll table view when keyboard display
    func moveTextField(textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
