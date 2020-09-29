/* where clauses on contextually generic declarations */
//SE-0267 introduced the ability to attach a where clause to functions inside generic types and extensions.

//For example, we could start with a simple Stack struct that let us push and pop values from a private array:

struct Stack<Element> {
    private var array = [Element]()

    mutating func push(_ obj: Element) {
        array.append(obj)
    }

    mutating func pop() -> Element? {
        array.popLast()
    }
}
//Using SE-0267, we could add a new sorted() method to that stack, but only for times when the elements inside the stack conform to Comparable:

extension Stack {
    func sorted() -> [Element] where Element: Comparable {
        array.sorted()
    }
}
