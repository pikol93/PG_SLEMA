import { Routes } from '@angular/router';
import { ConversationListComponent } from './conversation/view/conversation-list/conversation-list.component';
import { ChatViewComponent } from './chat/view/chat-view/chat-view.component';
import { UserListComponent } from './user/view/user-list/user-list.component';

export const routes: Routes = [
    {path: 'conversations', component: ConversationListComponent},
    {path: 'conversations/:id/chat', component: ChatViewComponent},
    {path: 'users', component: UserListComponent}
];