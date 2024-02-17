import Foundation

class Book {
    let title: String
    let author: String
    let year: Int
    let pageCount: Int
    
    init(title: String, author: String, year: Int, pageCount: Int) {
        self.title = title
        self.author = author
        self.year = year
        self.pageCount = pageCount
    }
    
    func displayInfo() {
        print("Title: \(title)")
        print("Author: \(author)")
        print("Year: \(year)")
        print("Page Count: \(pageCount)")
    }
}

class Library {
    var books: [Book]
    
    init(books: [Book] = []) {
        self.books = books
    }
    
    func addBook(book: Book) {
        books.append(book)
        print("\(book.title) has been added to the library.")
    }
    
    func removeBook(title: String) {
        if let index = books.firstIndex(where: { $0.title == title }) {
            let removedBook = books.remove(at: index)
            print("\(removedBook.title) has been removed from the library.")
        } else {
            print("The book \(title) is not found in the library.")
        }
    }
    
    func displayAllBooks() {
        if books.isEmpty {
            print("The library is empty.")
        } else {
            print("Books in the library:")
            for book in books {
                book.displayInfo()
                print("---------------------")
            }
        }
    }
}

let preexistingBooks = [
    Book(title: "To Kill a Mockingbird", author: "Harper Lee", year: 1960, pageCount: 281),
    Book(title: "1984", author: "George Orwell", year: 1949, pageCount: 328)
]

func getInput() -> String {
    let inputData = readLine() ?? ""
    return inputData
}

func main() {
    let library = Library(books: preexistingBooks)
    
    print("Welcome to the Library!")
    
    while true {
        print("\nChoose an option:")
        print("1. Add a book")
        print("2. Remove a book")
        print("3. Display all books")
        print("4. Exit")
        
        guard let choice = Int(getInput()) else {
            print("Invalid input. Please enter a number.")
            continue
        }
        
        switch choice {
        case 1:
            print("Enter book title:")
            let title = getInput()
            print("Enter author:")
            let author = getInput()
            print("Enter year:")
            guard let year = Int(getInput()) else {
                print("Invalid input for year. Please enter a number.")
                continue
            }
            print("Enter page count:")
            guard let pageCount = Int(getInput()) else {
                print("Invalid input for page count. Please enter a number.")
                continue
            }
            let book = Book(title: title, author: author, year: year, pageCount: pageCount)
            library.addBook(book: book)
        case 2:
            print("Enter the title of the book you want to remove:")
            let title = getInput()
            library.removeBook(title: title)
        case 3:
            library.displayAllBooks()
        case 4:
            print("Exiting...")
            return
        default:
            print("Invalid option. Please choose a number between 1 and 4.")
        }
    }
}

main()

