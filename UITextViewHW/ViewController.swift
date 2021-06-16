//
//  ViewController.swift
//  UITextViewHW
//
//  Created by Иван on 6/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    let fontsArray = ["Copperplate", "GillSans-Italic", "MarkerFelt-Wide", "CourierNewPS-BoldItalicMT", "AvenirNextCondensed-MediumItalic"]
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var reduseThickness: UIButton!
    @IBOutlet weak var increaseThickness: UIButton!
    
    @IBOutlet weak var fontStylePicker: UIPickerView!
    
    @IBOutlet weak var shareButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackButton.layer.borderColor = UIColor.black.cgColor
        whiteButton.layer.borderColor = UIColor.black.cgColor
        redButton.layer.borderColor = UIColor.black.cgColor
        yellowButton.layer.borderColor = UIColor.black.cgColor
        blueButton.layer.borderColor = UIColor.black.cgColor

        fontStylePicker.delegate = self
        fontStylePicker.dataSource = self
        
        fontSizeSlider.minimumValue = 1
        fontSizeSlider.maximumValue = 50
        fontSizeSlider.value = 25
        textView.font = UIFont.systemFont(ofSize: CGFloat(fontSizeSlider.value))
    }
    
    func changeColor(button: UIButton) {
        switch button {
        case blackButton: textView.textColor = .black
        case whiteButton: textView.textColor = .white
        case redButton: textView.textColor = .red
        case yellowButton: textView.textColor = .yellow
        case blueButton: textView.textColor = .blue
        default:
            textView.textColor = .black
        }
    }
    
    func changeFontThickness(button: UIButton) {
        switch button {
        case increaseThickness:
            textView.text = textView.text.uppercased()
        case reduseThickness: textView.text = textView.text.lowercased()
        default:
            return
        }
    }
    
    func shareButtonAction() {
        let objectsToShare: [Any] = [textView.text ?? ""]
        let activityController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityController.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        self.present(activityController, animated: true)
    }
    
    @IBAction func fontSizeSliderAction(_ sender: Any) {
        textView.font = UIFont.systemFont(ofSize: CGFloat(fontSizeSlider.value))
        
    }
    
    @IBAction func changeColorAction(_ sender: UIButton) {
        changeColor(button: sender)
    }
    
    @IBAction func changeFontThickness(_ sender: UIButton) {
        
        changeFontThickness(button: sender)
        
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareButtonAction()
    }
    

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fontsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        fontsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textView.font = UIFont(name: fontsArray[row], size: CGFloat(fontSizeSlider.value))
    }
    
    
}

