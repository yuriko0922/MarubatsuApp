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
    
    let questions: [[String: Any]] = [
        ["question": "イルカは哺乳類である",
            "answer": true
        ],
        ["question": "ゆりちゃんは背が低い",
         "answer": false
        ],
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    //バツボタン
    @IBAction func batuButton(_ sender: Any) {
    }
    //マルボタン
    @IBAction func maruButton(_ sender: Any) {
    }
    
}

