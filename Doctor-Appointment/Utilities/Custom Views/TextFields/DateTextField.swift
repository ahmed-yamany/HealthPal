//
//  DateTextField.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 15/11/2023.
//

import UIKit

class DateTextField: PrimaryTextField {
    private(set) var datePicker: UIDatePicker = UIDatePicker()
    // MARK: Properities
    var date: Date?
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
        configureDatePicker()
        placeholder = L10n.Profile.Textfield.date
        icon = .iconCalendar
        inputView = datePicker
        inputAccessoryView = createAccessoryView()
    }
    func configureDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    func createAccessoryView() -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        return toolBar
    }

}
extension DateTextField {
    @objc func donePressed() {
        date = datePicker.date
        text = formatedDate()
        self.endEditing(true)
    }
    func formatedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: datePicker.date)
    }
}
