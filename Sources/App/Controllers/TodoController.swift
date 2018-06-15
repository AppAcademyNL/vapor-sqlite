import Vapor
//import Leaf

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Todo]> {
        return Todo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        return try req.content.decode(Todo.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
    
//    func update(_ req: Request) throws -> Future<Todo> {
//        let newTodo = try req.content.syncDecode(Todo.self)
//        guard let id = newTodo.id else {
//            throw Abort(.notFound)
//        }
//        return try Todo.find(id, on: req).flatMap(to: Todo.self) { todo in
//            guard let todo = todo else {
//                throw Abort(.notFound)
//            }
//            todo.title = newTodo.title
//            return todo.save(on: req)
//        }
//    }

//    func web(_ req: Request) throws -> Future<View> {
//        struct ViewTodos: Codable {
//          var todos: [Todo]
//        }
//        return Todo.query(on: req).all().flatMap(to: View.self) { todos in
//            let context = ViewTodos(todos: todos)
//            return try req.view().render("list", context)
//        }
//    }
}
