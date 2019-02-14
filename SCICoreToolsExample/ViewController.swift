//
//  ViewController.swift
//  SCICoreToolsExample
//
//  Created by Maxim Schleicher on 10.12.18.
//  Copyright © 2018 scireum GmbH. All rights reserved.
//

import UIKit
import SCICoreTools

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(SCICoreTools.isPad)
        print(SCICoreTools.isPhone)
        let text = " "
        print(text.isBlank)
        print(90.degreesToRadians)
        let vc = SCICoreTools.loadControllerFromStoryboard(name: "Main", withIdentifier: "ViewController") as? ViewController
        if let _:ViewController = vc {
            print("true")
        }

        let x = UIStoryboard.main?.instantiateViewController(withClass: ViewController.self)
        if let _: ViewController = x {
            print("true")
        }

        let textField = UITextField()
        textField.text = " "
        print(textField.isEmpty)

        print("******")
        print("\(SCICoreTools.appName!) native \(SCICoreTools.deviceModel)".chainWithDashes())
        print(UIDevice.current.modelName)
        Log.debug(message: "test")
    }


}

