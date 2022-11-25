//
//  ViewController.swift
//  braille
//
//  Created by 서정덕 on 2022/07/13.
//

import UIKit
import KorToBraille

class ViewController: UIViewController {
    @IBOutlet var text: UITextField!
    @IBOutlet var result: UILabel!
    var brlnumArr: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func convert(_ sender: Any) {
        var str: String = text.text!
        var rValue:String = ""
        let cnt:Int = str.count
        for i in 0..<cnt{
            let char:Character = str.getChar(at: i)
            switch char {
            case "a":rValue.append("⠁")
            case "b":rValue.append("⠃")
            case "c":rValue.append("⠉")
            case "d":rValue.append("⠙")
            case "e":rValue.append("⠑")
            case "f":rValue.append("⠋")
            case "g":rValue.append("⠛")
            case "h":rValue.append("⠓")
            case "i":rValue.append("⠊")
            case "j":rValue.append("⠚")
            case "k":rValue.append("⠅")
            case "l":rValue.append("⠇")
            case "m":rValue.append("⠍")
            case "n":rValue.append("⠝")
            case "o":rValue.append("⠕")
            case "p":rValue.append("⠏")
            case "q":rValue.append("⠟")
            case "r":rValue.append("⠗")
            case "s":rValue.append("⠎")
            case "t":rValue.append("⠞")
            case "u":rValue.append("⠥")
            case "v":rValue.append("⠧")
            case "w":rValue.append("⠺")
            case "x":rValue.append("⠭")
            case "y":rValue.append("⠽")
            case "z":rValue.append("⠵")
            case " ":rValue.append("\n")
            default:
                rValue=KorToBraille.korTranslate(str)
                break
            }
            
        }
        
        result.text = rValue
        print(rValue)
        brlnumArr = brailleTo2D(brlStr: rValue)
        print(brlnumArr)
    }
    
    func brailleTo2D (brlStr bs: String) -> [Int] {

        var brlNUmArr: [Int] = []
        var brl: [Character] = ["⠀","⠁","⠂","⠃","⠄","⠅","⠆","⠇","⠈","⠉","⠊","⠋","⠌","⠍","⠎","⠏","⠐","⠑","⠒","⠓","⠔","⠕","⠖","⠗","⠘","⠙","⠚","⠛","⠜","⠝","⠞","⠟","⠠","⠡","⠢","⠣","⠤","⠥","⠦","⠧","⠨","⠩","⠪","⠫","⠬","⠭","⠮","⠯","⠰","⠱","⠲","⠳","⠴","⠵","⠶","⠷","⠸","⠹","⠺","⠻","⠼","⠽","⠾","⠿"]
        

        for i in 0..<bs.count{
            
            let char: Character = bs.getChar(at: i)
            if let firstIndex = brl.firstIndex(of: char) {
                brlNUmArr.append(firstIndex)
            }
            // Char Arr에서 찾은 인덱스를 brlNumArr에 추가
            
        }
        return brlNUmArr
    }
    
}


extension String {
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
