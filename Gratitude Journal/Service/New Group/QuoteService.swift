//
//  QuoteService.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/27/22.
//

import Foundation
import Firebase
import SwiftyJSON

class QuoteService {
    
    var reference = Database.database().reference(withPath: "Gratitude journal")
    
    public func createHabitsIdeas() {
        let value1 = ["quote": "\"To improve is to change, to be perfect is to change often\".",
                      "quoteRu": "\"Совершенствоваться – значит меняться, быть совершенным – значит меняться часто\".",
                      "author": "Winston Churchill",
                      "authorRu": "Уинстон Черчилль"]
        reference.child("quotes/quote1").setValue(value1)
        
        
        let value2 = ["quote": "\"I can't change the direction of the wind, but I can adjust my sails to always reach my destination\".",
                      "quoteRu": "\"Я не в силах изменить направление ветра, но я могу повернуть свои паруса, чтобы всегда достичь заданной цели\".",
                      "author": "Джимми Дин",
                      "authorRu": "Уинстон Черчилль"]
        reference.child("quotes/quote2").setValue(value2)
        
        let value3 = ["quote": "\"Your time is limited, so don't waste it living someone else's life. Don't be trapped by dogma – which is living with the results of other people's thinking\".",
                      "quoteRu": "\"Ваше время ограничено. Поэтому не тратьте его на то чтобы прожить чью-то чужую жизнь. Не попадайте в ловушку догмы, которая учит жить в соответствии с мыслями других людей\".",
                      "author": "Steve Jobs",
                      "authorRu": "Стив Джобс"]
        reference.child("quotes/quote3").setValue(value3)
        
        
        let value4 = ["quote": "\"Don’t be afraid to give up the good to go for the great\".",
                      "quoteRu": "\"Не бойтесь отказываться от хорошего ради великого\".",
                      "author": "John D. Rockefeller",
                      "authorRu": "Джон Дэвисон Рокфеллер"]
        reference.child("quotes/quote4").setValue(value4)
        
        let value5 = ["quote": "\"Be thankful for what you have; you’ll end up having more. If you concentrate on what you don’t have, you will never, ever have enough\".",
                      "quoteRu": "\"Будьте благодарны за то, что у вас есть, и в конечном итоге вы приобретете больше. Если вы концентрируете свое внимание на том, чего у вас нет, вам никогда не будет достаточно\".",
                      "author": "Oprah Winfrey",
                      "authorRu": " Опра Уинфри"]
        reference.child("quotes/quote5").setValue(value5)
        
        
        let value6 = ["quote": "\"For me, every hour is grace. And I feel gratitude in my heart each time I can meet someone and look at his or her smile\".",
                      "quoteRu": "\"Для меня каждый час — это благодать. И я чувствую благодарность в своем сердце каждый раз, когда я могу встретить кого-то и посмотреть на его или ее улыбку\".",
                      "author": "Elie Wiesel",
                      "authorRu": "Эли Визель"]
        reference.child("quotes/quote6").setValue(value6)
        
        let value7 = ["quote": "\"When eating fruit, remember the one who planted the tree\".",
                      "quoteRu": "\"Вкушая фрукты, помни о том, кто посадил дерево\".",
                      "author": "Vietnamese Proverb",
                      "authorRu": "Вьетнамская пословица"]
        reference.child("quotes/quote7").setValue(value7)
        
        let value8 = ["quote": "\"When you are grateful, fear disappears and abundance appears\".",
                      "quoteRu": "\"Когда вы благодарны, исчезает страх и появляется изобилие\".",
                      "author": "Anthony Robbins",
                      "authorRu": "Энтони Роббинс"]
        reference.child("quotes/quote8").setValue(value8)
        
        let value9 = ["quote": "\"This a wonderful day. I’ve never seen this one before\".",
                      "qouteRu": "\"Это был чудесный день. Я никогда не видела его раньше\".",
                      "author": "Maya Angelou",
                      "authorRu": "Майя Энджелоу"]
        reference.child("quotes/quote9").setValue(value9)
        
        
        let value10 = ["quote": "\"Strive to find things to be thankful for, and just look for the good in who you are\".",
                      "quoteRu": "\"Стремитесь найти вещи, за которые можно быть благодарным, и просто ищите хорошее в том, кто вы есть\".",
                      "author": "Bethany Hamilton",
                      "authorRu": "Бетани Гамильтон"]
        reference.child("quotes/quote10").setValue(value10)
    }
    
    public func loadData(completion: @escaping (Quotes) -> Void) {
        reference.child("quotes").observeSingleEvent(of: .value, with: { (snapShot) in
            if let data = snapShot.value as? [String: Any] {
                let quotes = Quotes(data: JSON(data).rawValue as! [String: Any])
                completion(quotes)
            }
        }) { (error) in print(error.localizedDescription) }
    }
}
