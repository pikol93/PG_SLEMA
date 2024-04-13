export interface ChatMessage {
    senderId: string;
    conversationId: string;
    content: string;
    dateTime: Date;
}