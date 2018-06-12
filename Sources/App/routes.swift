import Vapor
//import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

//	router.get("list") { req -> Future<View> in
//        let context: [String: [Todo]] = ["todos": [Todo(title: "dit moet je nog doen"),
//            Todo(title: "en dit!")]]
//        return try req.view().render("list", context)
//    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)

//    router.get("web", use: todoController.web)
}
