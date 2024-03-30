import { Routes } from '@angular/router';
import { ConversationListComponent } from './conversation/view/conversation-list/conversation-list.component';
import { MessageListComponent } from './message/view/message-list/message-list.component';

export const routes: Routes = [
    {path: 'conversations', component: ConversationListComponent},
    {path: 'conversations/:id/messages', component: MessageListComponent}
];