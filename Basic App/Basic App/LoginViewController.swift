//
//  LoginViewController.swift
//  Basic App
//
//  Created by KhanhVu on 5/18/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var phoneView: UIView!
    
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    @IBOutlet weak var hotlineView: UIView!
    @IBOutlet weak var btnContinue: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfPhoneNumber.delegate = self
        tfPhoneNumber.keyboardType = .numberPad
        setLayerView()
        
    }
    
    func setLayerView() {
        phoneView.layer.cornerRadius = 28
        phoneView.layer.shadowColor = UIColor.gray.cgColor
        phoneView.layer.shadowOffset = CGSize()
        phoneView.layer.shadowRadius = 28
        phoneView.layer.shadowOpacity = 0.3
        
        btnContinue.layer.cornerRadius = 24
        hotlineView.layer.cornerRadius = 24

        btnContinue.isEnabled = false
        btnContinue.alpha = 0.5
    }
    
    
    @IBAction func didTapBtnContinue(_ sender: Any) {
        
    }
    
    @IBAction func didTapBtnBack(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        phoneView.layer.borderWidth = 1
        phoneView.layer.borderColor = UIColor.blue.cgColor
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("ALL")
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string) as NSString
        if newString.length >= 1 {
            let c = newString.character(at: 0)
            let length = newString.length
            if c == 48 && length == 10 {
                btnContinue.isEnabled = true
                btnContinue.alpha = 1
            }else if c != 48 && length == 9 {
                btnContinue.isEnabled = true
                btnContinue.alpha = 1
            }else {
                btnContinue.isEnabled = false
                btnContinue.alpha = 0.5
            }
        }
        
        return true
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let maxLength = 5
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString =
//            currentString.replacingCharacters(in: range, with: string) as NSString
//        print(newString.length)
//        if newString. == "0" {
//
//        }
//        return newString.length <= maxLength
//    }
}
