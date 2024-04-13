import { Message } from "../../message/model/message";
import { ChatMember } from "./chat-member";

export interface ChatContent {
    messages: Message[],
    conversation: {
        title: string,
        members: ChatMember[]
    }
}