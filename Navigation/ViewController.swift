//
//  ViewController.swift
//  Navigation
//
//  Created by kingofahn on 23/06/2019.
//  Copyright © 2019 kingofahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn // 시작하면 켜져있는 전구 이미지 보임
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewConroller = segue.destination as! EditViewController
        if segue.identifier == "editButton" { // 버튼을 클릭한 경우
            editViewConroller.textWayValue = "segue : use button"
        } else if segue.identifier == "editBarButton" { // 바 버튼을 클릭한 경우
            editViewConroller.textWayValue = "segue : use Bar button"
        }
        editViewConroller.textMessage = txMessage.text!
        editViewConroller.isOn = isOn
        editViewConroller.delegate = self
    }
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

