//
//  Deck.swift
//  Poker Assistant
//
//  Created by Sean Hendrix on 12/11/18.
//  Copyright © 2018 Sean Hendrix. All rights reserved.
//

import Foundation

class Deck {

    struct Card {
        let rank: Rank
        let suit: Suit

        enum Rank: Int {
            case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
            case Jack, Queen, King, Ace

            func rankDescription() -> String {
                switch  self {
                case .Jack: return "Jack"
                case .Queen: return "Queen"
                case .King: return "King"
                case .Ace: return "Ace"
                default:
                    return String(self.rawValue)
                }

            }
            func cardsValue() -> Int {
                switch self {
                case .Jack: return 10
                case .Queen: return 10
                case .King: return 10
                case .Ace: return 20
                default:
                    return 5
                }
            }

        }

        enum Suit: String {
            case diamond = "♦"
            case heart = "♥"
            case club = "♣"
            case spade = "♠"
        }
    }

    func generateDeckOfCards() -> [Card] {
        var myDeckOfCards: Array = [Card]()
        let maxRank = Card.Rank.Ace
        let aSuit:Array = [Card.Suit.club.rawValue, Card.Suit.diamond.rawValue, Card.Suit.heart.rawValue, Card.Suit.spade.rawValue]

        for count in 2...maxRank.rawValue{
            for suit in aSuit{
                let aRank = Card.Rank.init(rawValue: count)
                let aSuit = Card.Suit.init(rawValue: suit)
                let myCard = Card(rank: aRank!, suit: aSuit!)
                myDeckOfCards.append(myCard)
            }
        }
        return myDeckOfCards
    }
}

