export interface Conversation {
    id: string;
    title: string;
    lastMessage: {
        content: string;
        dateTime: string;
        sender: {
            name: String
        }
    }
}
