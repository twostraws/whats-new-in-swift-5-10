/*:


&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
# Data races are now clearly diagnosed

Swift concurrency was introduced back in Swift 5.5, but had a bit of a rocky adoption both in Apple's own frameworks and our own projects. However, with Swift 5.10 the team made a rather dramatic statement: "Swift 5.10 closes all known static data-race safety holes in complete strict concurrency checking."

Concurrency checking is what allows the compiler to verify our use of concurrent code is safe – that we aren't accidentally sharing mutable state in a way that can cause race conditions. Of course, the key word here is "known": everything they *know about* has been resolved.

Apple's work here is not only hugely innovative, but hugely *complex*: similar to how type inference requires the Swift compiler to be able to reason about how various parts of our code are used, in concurrency the compiler is effectively running a series of algorithms that attempt to determine conclusively that our code is concurrency-safe.

To give you a concrete example, this code generated a warning in Swift 5.9:
*/
import SwiftUI
    
struct ContentView: View {
    var body: some View {
        Button("Tap Me", action: doWork)
    }
        
    func doWork() {
        print("Hello")
    }
}
/*:
That would throw up the rather unhelpful warning, "Converting function value of type '@MainActor () -> ()' to '() -> Void' loses global actor MainActor".

The problem here is that SwiftUI's `Button` view doesn't use `@MainActor` for its action, so Swift was throwing up a warning that we were calling a main actor-method from somewhere that isn't isolated to the main actor. This warning has been removed by the concurrency checking improvements in Swift 5.10: the compiler can now see the button action exists in side the `body` property, which *is* isolated to the main actor, and therefore is safe.

&nbsp;

[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/