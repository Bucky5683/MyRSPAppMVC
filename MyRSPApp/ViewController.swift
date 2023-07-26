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
    
    
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
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
        switch title {
        case "가위":
            //가위 열거형을 만들어서 저장
            myChoice = Rps.scissors
            break
        case "바위":
            //바위 열거형을 만들어서 저장
            myChoice = Rps.rock
            break
        case "보":
            //보 열거형을 만들어서 저장
            myChoice = Rps.paper
            break
        default:
            break
        }
    }
    
    @IBAction func selectButtonTab(_ sender: Any) {
        //컴퓨터가 선택한 이미지/레이블 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
       
        //내가 선택한 이미지/레이블 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        //컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지 졌는지 판단
        if comChoice == myChoice{
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper{
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors{
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock{
            mainLabel.text = "이겼다"
        } else if comChoice == .rock && myChoice == .scissors{
            mainLabel.text = "졌다"
        } else if comChoice == .scissors && myChoice == .paper{
            mainLabel.text = "졌다"
        } else if comChoice == .paper && myChoice == .rock{
            mainLabel.text = "졌다"
        }
    }
    
    @IBAction func resetButtonTab(_ sender: Any) {
        //초기상태 + 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        //1) 첫번째 두번째 이미지뷰에 준비 이미지 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        //2) 첫번째 두번째 레이블에 준비라고 문자열 띄워야 함
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        mainLabel.text="선택해주세요"
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
}
