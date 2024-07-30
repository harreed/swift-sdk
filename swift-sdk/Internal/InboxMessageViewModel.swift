//
//  Copyright © 2019 Iterable. All rights reserved.
//

import Foundation

public class InboxMessageViewModel {
    public let title: String
    public let subtitle: String?
    public let imageUrl: String?
    public var imageData: Data?
    public let createdAt: Date?
    public let read: Bool
    public let iterableMessage: IterableInAppMessage
    
    init(message: IterableInAppMessage) {
        title = InboxMessageViewModel.getTitle(message: message)
        subtitle = InboxMessageViewModel.getSubtitle(message: message)
        imageUrl = InboxMessageViewModel.getImageUrl(message: message)
        createdAt = message.createdAt
        read = message.read
        iterableMessage = message
    }
    
    func hasValidImageUrl() -> Bool {
        guard let imageUrlString = imageUrl else {
            return false
        }
        
        guard let _ = URL(string: imageUrlString) else {
            return false
        }
        
        return true
    }
    
    private static func getTitle(message: IterableInAppMessage) -> String {
        message.inboxMetadata?.title ?? ""
    }
    
    private static func getSubtitle(message: IterableInAppMessage) -> String? {
        message.inboxMetadata?.subtitle
    }
    
    private static func getImageUrl(message: IterableInAppMessage) -> String? {
        message.inboxMetadata?.icon
    }
}

extension InboxMessageViewModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(iterableMessage.messageId)
        hasher.combine(read)
    }
}

extension InboxMessageViewModel: Equatable {
    static public func == (lhs: InboxMessageViewModel, rhs: InboxMessageViewModel) -> Bool {
        guard lhs.iterableMessage.messageId == rhs.iterableMessage.messageId else { return false }
        guard lhs.read == rhs.read else { return false }
        
        return true
    }
}
