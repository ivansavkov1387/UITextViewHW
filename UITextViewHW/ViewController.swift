//
//  ViewController.swift
//  UITextViewHW
//
//  Created by Иван on 6/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    private let fontsArray = ["Copperplate", "GillSans-Italic", "MarkerFelt-Wide", "CourierNewPS-BoldItalicMT", "AvenirNextCondensed-MediumItalic"]
    private var selectedFont = "Copperplate"
    
    //MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var fontSizeSlider: UISlider!
    
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var changeThickness: UIButton!
    
    @IBOutlet weak var fontStylePicker: UIPickerView!
    
    @IBOutlet weak var shareButton: UIButton!
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackButton.layer.borderColor = UIColor.black.cgColor
        whiteButton.layer.borderColor = UIColor.black.cgColor
        redButton.layer.borderColor = UIColor.black.cgColor
        yellowButton.layer.borderColor = UIColor.black.cgColor
        blueButton.layer.borderColor = UIColor.black.cgColor
        
        fontStylePicker.delegate = self
        fontStylePicker.dataSource = self
        fontStylePicker.selectRow(0, inComponent: 0, animated: true)
        
        fontSizeSlider.minimumValue = 1
        fontSizeSlider.maximumValue = 50
        fontSizeSlider.value = 25
        
        textView.font = UIFont(name: selectedFont, size: CGFloat(fontSizeSlider.value))
        textView.text = textView.text.capitalized
        
    }
    
    //MARK: - Methods
    private func changeColor(button: UIButton) {
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
    
    private func changeFontThickness() {
        if textView.text == textView.text.capitalized {
            textView.text = textView.text.uppercased()
        } else {
            textView.text = textView.text.capitalized
        }
    }
    
    private func shareButtonAction() {
        let objectsToShare: [Any] = [textView.text ?? ""]
        let activityController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityController.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        self.present(activityController, animated: true)
    }
    
    //MARK: - Actions
    @IBAction func fontSizeSliderAction(_ sender: Any) {
        textView.font = UIFont(name: selectedFont, size: CGFloat(fontSizeSlider.value))
    }
    
    @IBAction func changeColorAction(_ sender: UIButton) {
        changeColor(button: sender)
    }
    
    @IBAction func changeFontThickness(_ sender: UIButton) {
        changeFontThickness()
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        shareButtonAction()
    }
    
}

    //MARK: - UIPickerViewDelegate, UIPickerViewDataSource
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
        selectedFont = fontsArray[row]
        textView.font = UIFont(name: fontsArray[row], size: CGFloat(fontSizeSlider.value))
    }
    
}

