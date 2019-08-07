//
//  ViewController.swift
//  CheckHealth App
//
//  Created by Sherif_Ashraf on 5/2/19.
//  Copyright © 2019 Sherif_Ashraf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var imageResult: UIImageView!
    
    
    @IBAction func resetButton(_ sender: Any) {
        heightTextField.text = ""
        weightTextField.text = ""
        labelText.isHidden = true
        imageResult.isHidden = true
    }
    @IBAction func showResultButton(_ sender: Any) {
        let weight = Int(weightTextField.text!)
        let height = Int(heightTextField.text!)
        if(weight != nil && height != nil){
            
            //Saving Data
        UserDefaults.standard.set(weight, forKey: "weight")
        UserDefaults.standard.set(height, forKey: "height")
            
            let result = (height! - weight!)

       // if let result = result {
            labelText.isHidden = false
            imageResult.isHidden = false
            if(result < 100){
                labelText.text = "You are fat ,please eat health food"
                imageResult.image = UIImage(named: "fat")
            }
            else if (result > 100){
                labelText.text = "Your are skinny , please eat some food"
                imageResult.image = UIImage(named: "skinny")

            }
            
            else if (result == 100){
                labelText.text = "You are perfect..! go along "
                imageResult.image = UIImage(named: "perfect")

            }
        }
        else{
//
//            print("There're non Enterd Data..!")
//             labelText.isHidden = false
//            labelText.text = "There're non Enterd Data..!"
//            imageResult.isHidden = true
            let alert = UIAlertController(title: "CheckHealth App", message: "Please Enter a Valid Data.!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//weightTextField.text = String (UserDefaults.standard.value(forKey: "weight") as! Int)
//        heightTextField.text = String(UserDefaults.standard.value(forKey: "height") as! Int)
        
        weightTextField.text = String(UserDefaults.standard.object(forKey: "weight") as! Int)
        heightTextField.text = String(UserDefaults.standard.object(forKey: "height") as! Int)
    }


}

