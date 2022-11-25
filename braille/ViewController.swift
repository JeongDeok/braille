//
//  ViewController.swift
//  braille
//
//  Created by 서정덕 on 2022/07/13.
//

import UIKit
import KorToBraille
import AVFoundation

class ViewController: UIViewController {
    
    var strIdx: Int = 0
    // 현재 읽고 있는 점자의 인덱스
    var brlnumArr: [String] = []
    // 점자 번호 이진수로 갖고있는 배열 ex) ["100011", "010010", "001001", "101100", "000000"]
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 터치한 상태에서 움직일 때마다 좌표 GCPoint로 얻어오는 함수
        let touch = touches.first!
        let point = touch.location(in: touch.view)
        
        
        if 175 < point.x && point.x < 275{
            if 500 < point.y && point.y < 600 {
                if brlnumArr[strIdx].getChar(at: 0) == "1"{
                    UIDevice.vibrate()
                    print("1")
                }
            }
            else if 600 < point.y && point.y < 700{
                if brlnumArr[strIdx].getChar(at: 1) == "1"{
                    UIDevice.vibrate()
                    print("2")
                }
            }
            else if 700 < point.y && point.y < 800{
                if brlnumArr[strIdx].getChar(at: 2) == "1"{
                    UIDevice.vibrate()
                    print("3")
                }
            }
        }
        else if 275 < point.x && point.x < 375{
            if 500 < point.y && point.y < 600 {
                if brlnumArr[strIdx].getChar(at: 3) == "1"{
                    UIDevice.vibrate()
                    print("4")
                }
            }
            else if 600 < point.y && point.y < 700{
                if brlnumArr[strIdx].getChar(at: 4) == "1"{
                    UIDevice.vibrate()
                    print("5")
                }
            }
            else if 700 < point.y && point.y < 800{
                if brlnumArr[strIdx].getChar(at: 5) == "1"{
                    UIDevice.vibrate()
                    print("6")
                }
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 터치가 시작 될 때 좌표 GCPoint로 얻어오는 함수
        let touch = touches.first!
        let point = touch.location(in: touch.view)
        if 175 < point.x && point.x < 275{
            if 500 < point.y && point.y < 600 {
                if brlnumArr[strIdx].getChar(at: 0) == "1"{
                    UIDevice.vibrate()
                    print("1")
                }
            }
            else if 600 < point.y && point.y < 700{
                if brlnumArr[strIdx].getChar(at: 1) == "1"{
                    UIDevice.vibrate()
                    print("2")
                }
            }
            else if 700 < point.y && point.y < 800{
                if brlnumArr[strIdx].getChar(at: 2) == "1"{
                    UIDevice.vibrate()
                    print("3")
                }
            }
        }
        else if 275 < point.x && point.x < 375{
            if 500 < point.y && point.y < 600 {
                if brlnumArr[strIdx].getChar(at: 3) == "1"{
                    UIDevice.vibrate()
                    print("4")
                }
            }
            else if 600 < point.y && point.y < 700{
                if brlnumArr[strIdx].getChar(at: 4) == "1"{
                    UIDevice.vibrate()
                    print("5")
                }
            }
            else if 700 < point.y && point.y < 800{
                if brlnumArr[strIdx].getChar(at: 5) == "1"{
                    UIDevice.vibrate()
                    print("6")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        strIdx = 0
    }
    

    
    @IBOutlet var text: UITextField!
    @IBOutlet var result: UILabel!
    
    
    @IBAction func forward(_ sender: Any) {

        if strIdx < brlnumArr.count - 1{
            UIDevice.vibrate()
            strIdx += 1
            // 표시되는 점자 변경
        }
        print("strIdx: \(strIdx)")
    }
    
    @IBAction func backward(_ sender: Any) {

        if 1 < strIdx{
            UIDevice.vibrate()
            strIdx -= 1
            // 표시되는 점자 변경
        }
        print("strIdx: \(strIdx)")
    }
    
    
    @IBAction func convert(_ sender: Any) {
        
        let str: String = text.text!
        // 입력받은 텍스트 저장
        var rValue:String = ""
        // 반환할 점자 스트링
        
        strIdx = 0
        // 새로운 str 들어와서 초기화 해줘야함
        
        for i in 0..<str.count{
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
            
        }// 점자로 변환해서 rValue에 저장

        result.text = rValue
        // 스토리보드의 텍스트 상자에 표시
        
        print(rValue)
        brlnumArr = brlToBin(brlStr: rValue)
        // 점자 이진수 str으로 바꿔서 배열에 저장
        print(brlnumArr)
        view.endEditing(true)
    }
    
    func brlToBin (brlStr bs: String) -> [String] {

        var brlNumArr: [String] = []
        let brl: [Character] = ["⠀","⠁","⠂","⠃","⠄","⠅","⠆","⠇","⠈","⠉","⠊","⠋","⠌","⠍","⠎","⠏","⠐","⠑","⠒","⠓","⠔","⠕","⠖","⠗","⠘","⠙","⠚","⠛","⠜","⠝","⠞","⠟","⠠","⠡","⠢","⠣","⠤","⠥","⠦","⠧","⠨","⠩","⠪","⠫","⠬","⠭","⠮","⠯","⠰","⠱","⠲","⠳","⠴","⠵","⠶","⠷","⠸","⠹","⠺","⠻","⠼","⠽","⠾","⠿"]
        

        for i in 0..<bs.count{
            
            let char: Character = bs.getChar(at: i)
            if let firstIndex = brl.firstIndex(of: char) {
                brlNumArr.append(String(String( format:"%06d", Int(String(firstIndex, radix: 2))!).reversed()))
                // https://gonslab.tistory.com/36 숫자 자릿수 있게 나타내기 ex) 000213
                // https://eunjin3786.tistory.com/497 2진수로 변환
            }
            // Char Arr에서 찾은 인덱스를 brlNumArr에 추가
            
        }
        return brlNumArr
    }
}

extension String {
    func getChar(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}

extension UIDevice {

    static func vibrate() {
        print("진동")
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    // https://lxxyeon.tistory.com/124 진동
}
