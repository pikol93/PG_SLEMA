export interface Message {
    id: string;
    sender: {
        id: string;
        name: string;
    }
    content: string;
    dateTime: string;
}