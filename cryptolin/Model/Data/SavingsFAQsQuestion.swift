//
//  SavingsFAQsData.swift
//  cryptolin
//
//  Created by Olayemi Abimbola on 27/10/2021.
//

import Foundation

struct SavingsFAQsQuestion: Hashable{
    
    enum Section{
        case FAQsSection
    }
    
    var question: String
    
    static let listOfQuestions: [SavingsFAQsQuestion] = [
        SavingsFAQsQuestion(question: "Why should is save in USDT?"),
        SavingsFAQsQuestion(question: "How much profit can I make within a month?"),
        SavingsFAQsQuestion(question: "What is Earning Rate?"),
        SavingsFAQsQuestion(question: "Can I withdraw monthly?"),
        SavingsFAQsQuestion(question: "Can I collect the entire USDT at the end of the plan or is it just the interest")
    ]

    init(question: String){
        self.question = question
    }
    
}

struct SavingsFAQsAnswer: Hashable{
    var answer: String

    static let listOfAnswers: [SavingsFAQsAnswer] = [
        SavingsFAQsAnswer(answer: "Savings in USDT protect your money against devalution and inflation. Because your local currency is not stable, it's safer to convert your money to dollar and save so that when you withdraw your USDT (dollar equivalent) and convert it back to your local currency, you still have then same value of money you saved"),
        SavingsFAQsAnswer(answer: "This depends on the savings plan option you choose. For 1 month is 0.8%, 3 months is 3%, 6 months is 7% and 12 months is 15% which means the longer you save, the more you earn"),
        SavingsFAQsAnswer(answer: "Earnings rate is the percentage of profit you make on top of the amount you saved at the end of the lock period"),
        SavingsFAQsAnswer(answer: "The answer is NO. You can only withdraw at the end of your savings plan. For example, If you subscribe for 3 months plan, you withdraw on your release day which is after 3 months. The same goes to the rest of the plans"),
        SavingsFAQsAnswer(answer: "Yes Cryptolinians, you can collect all of your USDT including the one you started with and the rest once your plan is due ")
    ]
    
    init(answer: String){
        self.answer = answer
    }
    
}

