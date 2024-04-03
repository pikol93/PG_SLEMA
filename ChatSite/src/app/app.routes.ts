import { Routes } from '@angular/router';
import { ConversationListComponent } from './conversation/view/conversation-list/conversation-list.component';
import { MessageListComponent } from './message/view/message-list/message-list.component';
import { ChatViewComponent } from './chat/view/chat-view/chat-view.component';

export const routes: Routes = [
    {path: 'conversations', component: ConversationListComponent},
    {path: 'conversations/:id/messages', component: MessageListComponent},
    {path: 'conversations/:id/chat', component: ChatViewComponent}
];