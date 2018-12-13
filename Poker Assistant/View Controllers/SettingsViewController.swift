//
//  SettingsViewController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/10/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var languageText: UITextField!
    @IBOutlet weak var currencyText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var timeText: UITextField!
    
    let languagePicker = UIPickerView()
    let currencyPicker = UIPickerView()
    let datePicker = UIPickerView()
    let timePicker = UIPickerView()
    
    let languages = ["English", "Spanish", "French", "Korean"]
    let currencies = ["USD", "EUR", "WON"]
    let dates = ["mm/dd/yyyy", "yyyy/dd/mm"]
    let times = ["12 Hour", "24 Hour"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let languagePicker = UIPickerView()
//        let currencyPicker = UIPickerView()
//        let datePicker = UIPickerView()
//        let timePicker = UIPickerView()
        
        languageText.inputView = languagePicker
        currencyText.inputView = currencyPicker
        dateText.inputView = datePicker
        timeText.inputView = timePicker
        
        languagePicker.delegate = self
        currencyPicker.delegate = self
        datePicker.delegate = self
        timePicker.delegate = self
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if pickerView == languagePicker {
//            return languages.count
//        } else if pickerView == currencyPicker {
//            return currencies.count
//        } else if pickerView == datePicker{
//            return dates.count
//        } else if pickerView == timePicker{
//            return times.count
//        } else {
//            return 1
//        }
        print(pickerView)
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if pickerView == languagePicker {
//            return languages[row]
//        } else if pickerView == currencyPicker {
//            return currencies[row]
//        } else if pickerView == datePicker{
//            return dates[row]
//        } else if pickerView == timePicker{
//            return times[row]
//        } else {
//            return ""
//        }
        return languages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView == languagePicker {
//            languageText.text = languages[row]
//        } else if pickerView == currencyPicker {
//            currencyText.text = currencies[row]
//        }
        languageText.text = languages[row]
    }
    
}


