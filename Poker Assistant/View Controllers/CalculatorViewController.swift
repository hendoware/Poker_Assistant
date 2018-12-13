//
//  CalculatorViewController.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/10/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//
//<div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
//<div>Icons made by <a href="https://www.flaticon.com/authors/kiranshastry" title="Kiranshastry">Kiranshastry</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
//<div>Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
//<div>Icons made by <a href="https://www.flaticon.com/authors/eucalyp" title="Eucalyp">Eucalyp</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
//<div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
//<div>Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> from <a href="https://www.flaticon.com/"                 title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/"                 title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>

import UIKit

class CalculatorViewController: UIViewController {
    
    var handOne: String = ""
    var handTwo: String = ""
    var board: String = ""
    var cardDeck = Deck()
    var deck: [Deck.Card] = []
    
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var handOneOutlet: UITextField!
    @IBOutlet weak var handTwoOutlet: UITextField!
    
    // change to buttons
    @IBOutlet weak var boardOutlet: UILabel!
    @IBOutlet weak var boardInputOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardOutlet.text = ""
        deck = cardDeck.generateDeckOfCards().shuffled()
        //        print(deck)
        
    }
    
    
    func predictOdds(_ handOne: String, _ handTwo: String,_ board: String) -> String {
        
        let result = "func predictOdds"
        let firstCard = String(handOne.prefix(2))
        let secondCard = String(handOne.suffix(2))
        let thirdCard = String(handTwo.prefix(2))
        let forthCard = String(handTwo.suffix(2))
        
        let boardCards = board.split(separator: ",")
        print(boardCards)
        print(firstCard,secondCard,thirdCard,forthCard)
        //        percent.text = firstCard
        //        percent.text = result
        return result
    }
    
    func calcPreFlop(_ handOne: String, _ handTwo: String) -> Int {
        
        let firstCard = String(handOne.prefix(2))
        let secondCard = String(handOne.suffix(2))
        
        let thirdCard = String(handTwo.prefix(2))
        let forthCard = String(handTwo.suffix(2))
        
        
        print(firstCard,secondCard,thirdCard,forthCard)
        return 0
    }
    
    func calcPostFlop(_ handOne: String, _ handTwo: String,_ board: String) -> (String, String, Int) {
        
        //        let boardCards = board.split(separator: ",")
        
        let firstCard = String(handOne.prefix(2))
        let secondCard = String(handOne.suffix(2))
        let thirdCard = String(handTwo.prefix(2))
        let forthCard = String(handTwo.suffix(2))
        var result: (String, String, Int) = ("", "", 0)
        let hero = setHandValue(firstCard, secondCard, board)
        let villain = setHandValue(thirdCard, forthCard, board)
//        print("hero/villian")
//        print(hero.0)
//        print(villian.0)
//        print(hero.1)
//        print(villian.1)
        if hero.1 == villain.1 {
            //fix
        } else if hero.1 > villain.1 {
            result = (hero.0, "Hero", hero.1)
        } else {
            result = (villain.0, "Villain", villain.1)
        }
        
        return result
    }
    
    func calcTurn(_ handOne: String, _ handTwo: String,_ board: String) -> Int {
        
        let boardCards = board.split(separator: ",")
        let firstCard = String(handOne.prefix(2))
        let secondCard = String(handOne.suffix(2))
        let thirdCard = String(handTwo.prefix(2))
        let forthCard = String(handTwo.suffix(2))
        print(boardCards)
        print(firstCard,secondCard,thirdCard,forthCard)
        
        return 0
    }
    
    var isStraight = false
    var isFlush = false
    
    func setHandValue(_ cardOne: String, _ cardTwo: String, _ board: String) -> (String, Int) {
        
        var result = 0
        var handRank = ""
        var isTrips = false
        var isPair = false
        let boardCards = board.split(separator: ",")
        //        find pairs and 3 of a kinds
        if cardOne.prefix(1) == cardTwo.prefix(1) {
//            print("1 pair")
            percent.text = " wins with 1 pair"
            result = 2 //+cardOne.value
            handRank = "Pair"
        }
        for a in boardCards {
            for b in boardCards {
                if cardOne.prefix(1) == a.prefix(1) {
//                    print("1 pair")
                    percent.text = " wins with 1 pair"
                    result = 2 //+cardOne.value
                    handRank = "Pair"
                    isPair = true
                } else if b.prefix(1) == a.prefix(1) {
                    
                    //fix with index......
                    if b == a {
                        //                        print("mismatch")
                    } else {
                        print("1 pair!!!!!!!!!!")
                        result = 2 //+b.value
                    }
                }
                
                //two pair
                
                //3 of a kind.......
                for c in boardCards {
                    
                if ((cardOne.prefix(1) == a.prefix(1)) && (cardOne.prefix(1) == b.prefix(1))) || (c.prefix(1) == a.prefix(1) && c.prefix(1) == b.prefix(1))  {
//                    print(cardOne.prefix(1))
//                    print("three of a kind")
                    percent.text = " wins with 3 of a kind"
                    result = 201
                    isTrips = true
                    handRank = "Three of a kind"
                }
                }
            
                
                //4 of a kind.......
                for c in boardCards {
                    if (cardOne.prefix(1) == a.prefix(1)) && (cardOne.prefix(1) == b.prefix(1)) && (c.prefix(1) == b.prefix(1)) {
//                        print(cardOne.prefix(1))
//                        print("four of a kind")
                        percent.text = " wins with 4 of a kind"
                        result = 601
                        handRank = "Four of a kind"
                    }
                }
            }
        }
        
        //find straight
        var boardCardValues: [String] = []
        
        for i in boardCards {
            boardCardValues.append(String(i.prefix(1)))
        }
        
        
        
        //add loop to change the temp card values to find all straights
        var tempCard1 = "A"
        var tempCard2 = "2"
        var tempCard3 = "3"
        var tempCard4 = "4"
        var tempCard5 = "5"
        for _ in boardCardValues {
            if boardCardValues.contains(tempCard1) || cardOne.prefix(1).contains(tempCard1) || cardTwo.prefix(1).contains(tempCard1) {
                if boardCardValues.contains(tempCard2) || cardOne.prefix(1).contains(tempCard2) || cardTwo.prefix(1).contains(tempCard2) {
                    if boardCardValues.contains(tempCard3) || cardOne.prefix(1).contains(tempCard3) || cardTwo.prefix(1).contains(tempCard3) {
                        if boardCardValues.contains(tempCard4) || cardOne.prefix(1).contains(tempCard4) || cardTwo.prefix(1).contains(tempCard4) {
                            if boardCardValues.contains(tempCard5) || cardOne.prefix(1).contains(tempCard5) || cardTwo.prefix(1).contains(tempCard5) {
                                percent.text = " wins with a straight"
                                result = 214
                                handRank = "Straight"
                                print("LETS GO \(handRank)")
                                isStraight = true
                            }
                        }
                    }
                }
            }
        }
        
        //find flush
        var boardSuits: [String] = []
        
        for i in boardCards {
            boardSuits.append(String(i.suffix(1)))
        }
        
        
        let tempSuit: [String] = ["h","s","d","c"]
        var suitCount = 0
        var maxCount = 0
        for suits in tempSuit {
            suitCount = 0
//            print(suits)
            for i in 0..<boardCards.count {
//                print("boardsuits[i] \(boardSuits[i])")
                if boardSuits[i] == suits {
                    suitCount += 1
                    
//                    print("card \(i) suit")
                }
            }
            if cardOne.suffix(1) == suits {
                suitCount += 1
//                print("card one suit")
            }
            if cardTwo.suffix(1) == suits {
                suitCount += 1
//                print("card two suit")
            }
            if maxCount < suitCount {
                maxCount = suitCount
            }
            
        }
//        print("card1 \(cardOne.prefix(2))")
//        print("card2 \(cardTwo.prefix(2))")
//        print("card1 \(cardOne)")
//        print("card2 \(cardTwo)")
//        print("suitcount \(maxCount)")
        if maxCount == 5 {
            percent.text = " wins with a flush"
            result = 229
            handRank = "Flush"
            print("LETS GO \(handRank)")
            isFlush = true
            
        }
        //full house
        if isTrips && isPair {
            percent.text = " wins with a full house"
            result = 401
            handRank = "FullHouse"
            print("LETS GO \(handRank)")
        }
        
        
        //find four of a kind?
        var boardValues: [String] = []

        for i in boardCards {
            boardValues.append(String(i.prefix(1)))
        }
        let tempValue: [String] = ["A","K","Q","J","T","9","8","7","6","5","4","3","2"]
        var cardCount = 0
        var maxCardCount = 0
        for values in tempValue {
            cardCount = 0
            //            print(suits)
            for i in 0..<boardCards.count {
                //                print("boardsuits[i] \(boardSuits[i])")
                if boardSuits[i] == values {
                    cardCount += 1

                    //                    print("card \(i) suit")
                }
            }
            if cardOne.prefix(1) == values {
                cardCount += 1
                //                print("card one suit")
            }
            if cardTwo.prefix(1) == values {
                cardCount += 1
                //                print("card two suit")
            }
            if maxCardCount < cardCount {
                maxCardCount = cardCount
            }

        }

        if maxCardCount == 4 {
            percent.text = "Hero wins with a four of a kind"
            result = 601
            print("aoihgFOURRRRRRRRR")
            handRank = "Four of a kind"
            print("LETS GO \(handRank)")
        }
        
        //straight flush
        if isFlush && isStraight {
            percent.text = " wins with a straight flush!!!"
            result = 614
            handRank = "Straight Flush"
            print("LETS GO \(handRank)")
        }
        
        //royal flush
        
        
        return (handRank, result)
        
    }
    
    
    //hand ranks
    /*
     royal flush 1000
     straight flush 614-800
     four of a kind 601-613
     full house 401-600
     flush 229-400
     straight 214-228
     three of a kind 201-213
     two pair 28-200
     one pair 15-27
     2,3,4,5,6
     7,8,9,10,J
     Q,K,A
     high card 2-14
     */
    
    /*
     for aCard in singleCard {
     let dealtCard = deck.removeLast()
     aCard.setTitle("\(dealtCard.rank.rankDescription()) \(dealtCard.suit.rawValue)", for UIControlState.normal)
     }
     }
     */
    
    //add tags for .....
    func updateCardDeck() {
        let nextCard = deck.last
        percent.text = ("\(nextCard!.rank.rankDescription()) \(nextCard!.suit.rawValue)")
    }
    
    func runTheDeck(_ n: Int) -> [String] {
        var result: [String] = []
        var turnFull = ""
        var riverFull = ""
        
        for _ in 1...n {
            deck.shuffle()
            let turn = deck.removeLast()
            let river = deck.removeLast()
            var turnSuit = ""
            var turnValue = ""
            turnSuit = "\(turn.suit)"
            turnSuit = String(turnSuit.prefix(1))
            turnValue = String(turn.rank.rankDescription().prefix(1))
            turnFull = "\(turnValue)\(turnSuit)"
            var riverSuit = ""
            var riverValue = ""
            riverSuit = "\(river.suit)"
            riverSuit = String(riverSuit.prefix(1))
            riverValue = String(river.rank.rankDescription().prefix(1))
            riverFull = "\(riverValue)\(riverSuit)"
        }
        
        result.append(turnFull)
        result.append(riverFull)
//        print("result = \(result)")
        return result
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        let hOne = handOneOutlet.text
        let hTwo = handTwoOutlet.text
        let community = boardInputOutlet.text
        //        predictOdds(hOne!, hTwo!, community!)
        //        updateCardDeck()
        let calc = calcPostFlop(hOne!, hTwo!, community!)
        let chance = 0.75
        let noChance = (abs(1-chance)*100)
        let maybe = String(format: "%.1f", noChance)
        let winner = calc.1
//        print("calc \(calc.0) calc2 \(calc.1) calc3 \(calc.2)")
//        print("\(winner): \(chance*100)% Villain \((abs(1-chance))*100)%")
        runTheDeck(2)
        if calc.0 != "" {
            percent.text = ("\(winner): \(chance*100)% Villain \(maybe)% with a \(calc.0)")
        }
//        percent.text = ("Hero: \(chance*100)% Villain: \((abs(1-chance))*100)%")
        if handOneOutlet.text?.count != 4 || handTwoOutlet.text?.count != 4 {
            percent.text = "invalid entry for hand 1 or 2"
        }
        if chance > 0.49 {
            percent.textColor = UIColor(red: 88/255, green: 156/255, blue: 88/255, alpha: 1.0)
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        //        handTwoOutlet.text = ""
        //        handOneOutlet.text = ""
        percent.text = ""
        boardOutlet.text = ""
        boardInputOutlet.text = ""
        //        handRank = ""
        isStraight = false
        isFlush = false
//        suitCount = 0
        deck = cardDeck.generateDeckOfCards()
        deck.shuffle()
    }
}



