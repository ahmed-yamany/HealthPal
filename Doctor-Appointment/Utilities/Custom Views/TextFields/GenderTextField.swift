//
//  GenderTextField.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 15/11/2023.
//
import UIKit
import Extensions

class GenderTextField: PrimaryTextField {
    private(set) var genderPicker: GenderPickerView = GenderPickerView()
    // MARK: Properities
    var gender: Gender?
    // MARK: Init
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    //
    private func configureUI() {
        placeholder = L10n.Profile.Textfield.gender
        righIcon = .iconChevronDown
        inputView = genderPicker
        inputAccessoryView = createAccessoryView()
    }
    func createAccessoryView() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        return toolBar
    }

}
extension GenderTextField {
    @objc func donePressed() {
        text = genderPicker.currentGender().rawValue
        self.endEditing(true)
    }

}
