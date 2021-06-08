import ArgumentParser
import Foundation

struct SafeLocalizedStringKey: ParsableCommand {
    
    @Option(name: .short)
    var inputFile: String

    @Option(name: .short)
    var outputFile: String

    mutating func run() throws {
        
        guard let dictionary = NSDictionary(contentsOfFile: inputFile) as? [String: String] else {
            throw RuntimeError("Couldn't read from '\(inputFile)'!")
        }
        
        let localizations = dictionary.sorted(by: { $0 < $1 }).map(Localization.init(key:value:))
        let file = File(functions: localizations.map(Function.init(localization:)))
        
        print(dictionary)
        print(file.content)
        
        let output = file.content
        
        guard let _ = try? output.write(toFile: outputFile, atomically: true, encoding: .utf8) else {
            throw RuntimeError("Couldn't write to '\(outputFile)'!")
        }
    }
}

struct RuntimeError: Error, CustomStringConvertible {
    var description: String
    
    init(_ description: String) {
        self.description = description
    }
}
