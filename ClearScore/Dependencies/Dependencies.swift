import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { ScoreRepository() }.implements(ScoreProtocol.self)
    }
}
