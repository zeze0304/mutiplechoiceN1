//
//  ViewController.swift
//  mutiplechoice
//
//  Created by MacbookPro on 2023/1/7.
//

import UIKit

class ViewController: UIViewController {
    
    var Questions = [question]()
    var index = 0
    var score = 0
    var correctAnswer = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let question1 = question(description: "祭典", option: ["さいてん", "かいまく", "ヘクタール", "しきち"], answers: "さいてん")
        Questions.append(question1)
        
        let question2 = question(description: "樽", option: ["たる", "けいば", "しゅうきゃく", "かんとく"], answers: "たる")
        Questions.append(question2)
        
        let question3 = question(description: "本場", option: ["ほんば", "ぶっけん", "すがた", "じゅうらい"], answers: "ほんば")
        Questions.append(question3)
        
        let question4 = question(description: "節目", option: ["ふしめ", "しせい", "けいい", "いくせい"], answers: "ふしめ")
        Questions.append(question4)
        
        let question5 = question(description: "枠", option: ["わく", "さむらい", "ゆみ", "やり"], answers: "わく")
        Questions.append(question5)
        
        let question6 = question(description: "藻掻く", option: ["もがく", "もゆく", "わがく", "わゆく"], answers: "もがく")
        Questions.append(question6)
        
        let question7 = question(description: "無闇に", option: ["むやみに", "むがみに", "むやくに", "むやつに"], answers: "むやみに")
        Questions.append(question7)
        
        let question8 = question(description: "無茶", option: ["むちゃ", "こうずい", "いじゅう", "だんけつ"], answers: "むちゃ")
        Questions.append(question8)
        
        let question9 = question(description: "見込む", option: ["みこむ", "みこよむ", "みこけむ", "みことむ"], answers: "みこむ")
        Questions.append(question9)
        
        let question10 = question(description: "纏まり", option: ["まとまり", "いとまり", "みとまり", "まいまり"], answers: "まとまり")
        Questions.append(question10)

        
        
        Questions.shuffle()
        gamePlay()
        
    }


    func gamePlay(){
        
        //選項洗牌
        Questions[index].option.shuffle()
        
        //顯示題目
        questionLabel.text = Questions[index].description
        
        //存入正確答案
        correctAnswer = Questions[index].answers
        
        //設置選項
        for i in 0...3{
        answers[i].setTitle(Questions[index].option[i], for: .normal)
            
        }
       //顯示第幾題
        numberLabel.text = "第\(index+1)次答題"
    
                
    }
    
    
    @IBAction func restart(_ sender: Any) {
        
        index = 0
        score = 0
        scoreLabel.text = String(score)
        progressBar.progress = 0.1
        Questions.shuffle()
        gamePlay()
        
    }
    
    func alertMessage(switchTitle: String, swithMessage: String){
        
        let alert = UIAlertController(
            title: switchTitle, message: swithMessage, preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "再挑戰一次", style: .default, handler: (restart(_:)))
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func gameOver(){
        
        
        if score >= 50{
            alertMessage(switchTitle: "score:\(score)", swithMessage: "太厲害了")
        }
        else{
            alertMessage(switchTitle: "score:\(score)", swithMessage: "再接再厲")
        }
        
    }
    
    @IBAction func clickAnswer(_ sender: UIButton) {
        
        //打完一題索引要+1(進入下一題)
        index += 1
        
        //進度跟者跑 1代表100% 共10題 一題是0.1
        progressBar.progress += 0.1
        
        //檢查用
        print(index)
        print(progressBar.progress)
        
        //如果按下的選項等於正確答案  加10分並顯示分數
        if sender.currentTitle == correctAnswer{
            score += 10
            scoreLabel.text = "\(score)分"
            
            //過了第10題就不繼續遊戲
            if index < 10 {
                gamePlay()
            }
            else{
                gameOver()
            }
        }
        
        
    }
    
    
    
}

