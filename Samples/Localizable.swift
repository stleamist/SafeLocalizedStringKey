import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension LocalizedStringKey {
	/// Pushed `%lld` commits and pulled `%lld` commits
	static func pushed_lld_commits_and_pulled_lld_commits(_ lld1: Int64,_ lld2: Int64) -> LocalizedStringKey {
	    return "pushed_\(lld1)_commits_and_pulled_\(lld2)_commits"
	}
	/// Pushed `%lld` commits
	static func pushed_lld_commits(_ lld1: Int64) -> LocalizedStringKey {
	    return "pushed_\(lld1)_commits"
	}
	/// Pushed no commits
	static func pushed_no_commits() -> LocalizedStringKey {
	    return "pushed_no_commits"
	}
}
