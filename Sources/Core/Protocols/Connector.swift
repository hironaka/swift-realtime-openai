import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol Connector: Sendable {
	@MainActor var status: RealtimeAPI.Status { get }
	var events: AsyncThrowingStream<ServerEvent, Error> { get }
	var statusUpdates: AsyncStream<RealtimeAPI.Status> { get }

	static func create(connectingTo request: URLRequest) async throws -> Self

	func disconnect()
	func send(event: ClientEvent) async throws
}
