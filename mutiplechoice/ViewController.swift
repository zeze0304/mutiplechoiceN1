//
//  ViewController.swift
//  mutiplechoice
//
//  Created by MacbookPro on 2023/1/7.
//

//畫面用UIKit
import UIKit

class ViewController: UIViewController {
    
    //設變數Questions為question的array陣列
    var Questions = [question]()
    //設變數index數列為0
    var index = 0
    //設變數score分數為0
    var score = 0
    //設變數correctAnswe解答為空字串""
    var correctAnswer = ""
    
    //拉題目的outlet為questionLabel，型別為UILabel
    @IBOutlet weak var questionLabel: UILabel!
    //拉第幾題的outlet為numberLabel，型別為UILabel
    @IBOutlet weak var numberLabel: UILabel!
    //拉分數的outlet為scoreLabel，型別為UILabel
    @IBOutlet weak var scoreLabel: UILabel!
    //拉答案選項的outlet為answers，型別為UIButton
    @IBOutlet var answers: [UIButton]!
    //拉第幾題進度線的outlet為progressBar，型別為UIProgressView
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //設常數question1為array，[question]
        //由於已經設question的類別為struct，因此產生東西時可直接使用類別裡的屬性
        //加入先前設好的屬性description/option/answers
        let question1 = question(description: "祭典", option: ["さいてん", "かいまく", "ヘクタール", "しきち"], answers: "さいてん")
        //屬性append為array加東西，常數question1成為array[question]
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

        //呼叫方法：物件變數＋.＋func+( 參數 )
        //呼叫指令：隨機出題
        Questions.shuffle()
        //呼叫指令：開始遊戲後的所有動作
        gamePlay()
        
    }

    //方法：開始遊戲後的所有動作
    func gamePlay(){
        
        //答案選項洗牌
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
    
    //拉重新開始按鈕的Action為restart
    @IBAction func restart(_ sender: Any) {
        
        //讓數列為0
        index = 0
        //讓分數score為0
        score = 0
        //用text顯示分數scoreLabel，設型別為字串String
        scoreLabel.text = String(score)
        //用progress顯示進度線progressBar為0.1
        progressBar.progress = 0.1
        //呼叫指令：隨機出題
        Questions.shuffle()
        //呼叫指令：開始遊戲後的所有動作
        gamePlay()
        
    }
    
    //跳出訊息，設func alertMessage
    func alertMessage(switchTitle: String, swithMessage: String){
        
        //型別省略寫法
        //設常數alert為提示框UIAlertController
        let alert = UIAlertController(
            title: switchTitle, message: swithMessage, preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "再挑戰一次", style: .default, handler: (restart(_:)))
        
        //用屬性addAction來顯示提示框
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    //讓遊戲結束
    func gameOver(){
        
        //如果分數大於等於50，呼叫指令alertMessage
        if score >= 50{
            alertMessage(switchTitle: "score:\(score)", swithMessage: "太厲害了")
        }
        else{
            alertMessage(switchTitle: "score:\(score)", swithMessage: "再接再厲")
        }
        
    }
    
    //拉選項按鈕Action為clickAnswer，因調整型別為UIButton，產生東西時可直接使用類別裡的屬性
    @IBAction func clickAnswer(_ sender: UIButton) {
        
        //打完一題索引要+1(進入下一題)
        index += 1
        
        //進度跟著跑，1代表100%，共10題，一題是0.1
        progressBar.progress += 0.1
        
        //檢查用
        print(index)
        print(progressBar.progress)
        
        //如果按下的選項等於正確答案，加10分並顯示分數
        //==:相等
        //+=:score = score+10
        //\(score):將score由數字變字串
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

