@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension LocalizedStringKey {
    /// Pushed `%lld` commits
    static func pushed_lld_commits(_ lld1: Int64) -> LocalizedStringKey {
        return "pushed_\(lld1)_commits"
    }
}
