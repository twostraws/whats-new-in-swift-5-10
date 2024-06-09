/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Allow Protocols to be Nested in Non-Generic Contexts

[SE-0404](https://github.com/apple/swift-evolution/blob/main/proposals/0404-nested-protocols.md) allows us to create nested protocols, meaning that we can place protocols inside structs, enums, classes, actors, and even functions, with the sole restriction that whatever we're nesting the protocol in can't use generics.

This is particularly helpful when common names are given to protocols. For example, the word "transaction" could feasibly be used to mean an animation transaction, a bank transaction, and a database transaction all in the same app.

One way to resolve this is by using compound names – we add more words to protocol names to clarify what we mean, like this:
*/
protocol AnimationTransaction {
}
    
protocol BankTransaction {
}
    
protocol DatabaseTransaction {
}
/*:
Another common problem also occurs when several similar protocols exist. For example, in SwiftUI we have protocols for `ButtonStyle`, `LabelStyle`, `ListStyle`, and more, all encapsulating the idea that a view can be styled in various ways.

Both of these can be resolved with this change. In the case of transactions, we could nest each transaction type inside whatever type it operated on:
*/
struct Animation {
    protocol Transaction {
    }
}
    
struct Bank {
    protocol Transaction {
    }
}
    
struct Database {
    protocol Transaction {       
    }
}
/*:
Where those protocols are used externally, they would now be written `Animation.Transaction`, `Bank.Transaction`, and `Database.Transaction`, but inside their respective structs they can just be referred to as `Transaction`.

In theory, SwiftUI could also move to `Button.Style`, `List.Style`, and so on, but that feels like a big change at this point.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/