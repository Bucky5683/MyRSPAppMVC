//
//  ViewController.swift
//  MyRSPApp
//
//  Created by 김서연 on 2023/07/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 가위바위보 게임 관리를 위한 인스턴스
    var rpsManager = RPSManager()
    
    var comChoice: Rps = Rps.allCases[Int.random(in: 1...3)]
    var myChoice: Rps = Rps.allCases[Int.random(in: 1...3)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //1) 첫번째 두번째 이미지뷰에 준비 이미지 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        //2) 첫번째 두번째 레이블에 준비라고 문자열 띄워야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        mainLabel.text="선택해주세요"
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //가위/바위/보(enum)를 선택해서 그 정보를 저장해야 함
        guard let title = sender.currentTitle else{
            //타이틀이 있다면 title이란 변수에 저장함
            return
        }
        myChoice = selectedRPS(withString: title)
    }
    
    func getReady() {
        mainLabel.text = "선택하세요"
        
        comImageView.image = Rps.ready.rpsInfo.image
        comChoiceLabel.text = Rps.ready.rpsInfo.name
        
        myImageView.image = Rps.ready.rpsInfo.image
        myChoiceLabel.text = Rps.ready.rpsInfo.name
    }
    
    @IBAction func selectButtonTab(_ sender: Any) {
        //내가 선택한 이미지/레이블 표시
        comImageView.image = comChoice.rpsInfo.image
        comChoiceLabel.text = comChoice.rpsInfo.name

        myImageView.image = myChoice.rpsInfo.image
        myChoiceLabel.text = myChoice.rpsInfo.name
        
        mainLabel.text = rpsManager.getRpsResult(comChoice: self.comChoice, myChoice: self.myChoice)
    }
    
    func selectedRPS(withString name: String) -> Rps {
        switch name {
        case "가위":
            return Rps.scissors
        case "바위":
            return Rps.rock
        case "보":
            return Rps.paper
        default:
            return Rps.ready
        }
    }
    
    @IBAction func resetButtonTab(_ sender: Any) {
        getReady()
        comChoice = Rps.allCases[Int.random(in: 1...3)]
    }
}
