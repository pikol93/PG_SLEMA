export interface ChatMessage {
    senderId: string;
    conversation: {
        id: string;
        title: string;
    }
    content: string;
    dateTime: Date;
}