//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 津國　由莉子 on 2019/08/03.
//  Copyright © 2019 yurityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //クイズの問題を表示
    @IBOutlet weak var questionLabel: UILabel!
    
    //問題管理
    var currentQuestionNum: Int = 0
    
    //正解した問題の数
    var okNum: Int = 0
    
    //ヒント管理
    var isHint: Bool = false
    
    
    let questions: [[String: Any]] = [
        ["question": "イルカは哺乳類である",
         "answer": true,
         "hint": "イルカは水の中では息ができないんだって"
        ],
        ["question": "ゆりちゃんは背が低い",
         "answer": false,
         "hint": "ゆりちゃんのあだ名は進撃の巨人だよ"
        ],
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    //問題を表示する関数
    func showQuestion() {
        //カレントクウェスチョンナンバーの問題を表示
        let question = questions[currentQuestionNum]
        
        //問題からKeyを指定して内容を取得
        if let que = question["question"] as? String {
            // question Key の中身をLabelに代入
            questionLabel.text = que
        }
    }
    //正解なら次の問題を取得する
    func checkAnswer(yourAnswer: Bool) {
        
        //どの問題か取得する
        let question = questions[currentQuestionNum]
        
        //問題の答えを取り出す
        if let ans = question["answer"]as? Bool {
            print(currentQuestionNum)
            
            //選択された答えと問題の答え比較
            if yourAnswer == ans {
                //正解
                
                
                
                //最後の問題かどうか
                if currentQuestionNum >= questions.count - 1 {
                    //最後の問題だった場合正解数の表示
                    showAlert(message:"\(questions.count)問中\(okNum)問正解です")
                    trueNum(ok: okNum)
                    
                } else {
                    showAlert(message: "正解！")
                    //最後の問題ではなかった場合次の問題に進む
                    currentQuestionNum += 1
                }
                
            } else {
                //不正解
                
                
                //最後の問題かどうか
                if currentQuestionNum >= questions.count - 1 {
                    //最後の問題だった場合正解数の表示
                    showAlert(message:"\(questions.count)問中\(okNum)問正解です")
                } else {
                    showAlert(message: "残念！")
                    //最後の問題ではなかった場合次の問題に進む
                    currentQuestionNum += 1
                    
                }
            }
        } else {
            print("答えが入っていません")
            return
        }
        
        // currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        
        //問題を表示します
        //正解があれば次の問題。不正解同じ問題
        showQuestion()
    }
    func trueNum(ok: Int){
        showAlert(message: "\(questions.count)問中\(okNum)問正解です")
    }
    
    
    
    // アラートを表示する関数
    func showAlert(message: String) {
        //アラートの作成
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        //アラートのアクション(ボタン部分の定義）
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        //作成したアラートに閉じるボタン追加
        alert.addAction(close)
        //アラートを表示する
        present(alert,animated: true, completion: nil)
    }
    
    
    
    //バツボタン
    @IBAction func batuButton(_ sender: Any) {
        
        //
        checkAnswer(yourAnswer: false)
    }
    //マルボタン
    @IBAction func maruButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    //ヒントボタン
    @IBAction func hinntoButton(_ sender: Any) {
        if !isHint {

            let question = questions[currentQuestionNum]
            
            if let ans = question["hint"] as? String {

                showAlert(message: ans)
            }
            //一回しか使えないヒント
            isHint = true
        }
    }
    
    
}

