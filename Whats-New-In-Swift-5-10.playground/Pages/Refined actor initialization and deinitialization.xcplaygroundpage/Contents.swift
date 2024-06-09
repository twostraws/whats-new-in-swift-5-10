/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)
# Refined actor initialization and deinitialization

[SE-0327](https://github.com/apple/swift-evolution/blob/main/proposals/0327-actor-initializers.md) adds some clarifications about how state inside actors is created and destroyed, and also relaxes some rules that were overly restrictive.

This proposal contains a number of small, specific changes to actors. For example, Swift will now automatically make actors with an async initializer move to the actor's executor when all its properties are initialized.

In code, it means the two `print()` calls shown below might execute on entirely different threads:
*/
actor Actor {
    var name: String
    
    init(name: String) async {
        print(name)
        self.name = name
        print(name)
    }
}
    
let actor = await Actor(name: "Margot")
/*:
This means the code has a potential suspension directly after the `name` property is set.

&nbsp;

[< Previous](@previous)           [Home](Introduction)
*/