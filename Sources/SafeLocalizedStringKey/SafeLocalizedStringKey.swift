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
        
        let localizations = dictionary.map(Localization.init(key:value:))
        
        print(dictionary)
        print(localizations.map(\.functionDefinition))
        
        let output = localizations.map(\.functionDefinition).joined(separator: "\n\n")
        
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
