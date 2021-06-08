SafeLocalizedStringKey.main(
    [
        "-i", #file.replacingOccurrences(of: "Sources/SafeLocalizedStringKey/main.swift", with: "Samples/Localizable.strings"),
        "-o", #file.replacingOccurrences(of: "Sources/SafeLocalizedStringKey/main.swift", with: "Samples/Localizable.swift"),
    ]
)
