export interface Message {
    id: string;
    sender: {
        id: string;
        nickname: string;
    }
    content: string;
}