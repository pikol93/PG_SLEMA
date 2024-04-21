import { ChatMessage } from "../../chat/model/chat-message";

export interface NewConversation {
    title: string;
    initiatorId: string;
    message: ChatMessage;
}