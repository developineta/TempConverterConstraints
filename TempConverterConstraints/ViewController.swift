//
//  ViewController.swift
//  TempConverterConstraints
//
//  Created by ineta.magone on 14/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inCelsius: UILabel!
    @IBOutlet weak var sliderOfDegrees: UISlider!
    @IBOutlet weak var convertedTemperature: UILabel!
    @IBOutlet weak var tempSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        convertedTemperature.text = "32 ºF"
    }

    @IBAction func sliderValueChanged(_ sender: Any) {
        print("sliderOfDegrees:" , sliderOfDegrees.value)
        updateTempLabelForSlider(value: sliderOfDegrees.value)
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        print("tempSlider:" , sliderOfDegrees.value)
        updateTempLabelForSlider(value: sliderOfDegrees.value)
    }
    
    func updateTempLabelForSlider(value: Float){
        let celsiusTemp = Int(value)
        
        inCelsius.text = "\(celsiusTemp) ºC"
        
        var convertedTempString = ""
        switch tempSegmentControl.selectedSegmentIndex {
        case 0:
            let fahreinheitTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).fahrenheit)
            convertedTempString = fahreinheitTempString + " ºF"
        default:
            let kelvinTempString = String(format: "%.2F", convertTempFrom(celsius: celsiusTemp).kelvin)
            convertedTempString = kelvinTempString + " ºK"
        }
        convertedTemperature.text = convertedTempString
    }
    
    func convertTempFrom(celsius: Int) -> (fahrenheit: Double, kelvin: Double){
        let fahrenheit = (Double(celsius) * 9 / 5) + 32
        let kelvin = Double(celsius) + 273.15
        return (fahrenheit, kelvin)
    }
}

