import { Routes } from '@angular/router';
import { ConversationListComponent } from './conversation/view/conversation-list/conversation-list.component';
import { ChatViewComponent } from './chat/view/chat-view/chat-view.component';
import { UserListComponent } from './user/view/user-list/user-list.component';
import { UserDetailsComponent } from './user/view/user-details/user-details.component';
import { ConversationNewComponent } from './conversation/view/conversation-new/conversation-new.component';

export const routes: Routes = [
    {path: 'conversations', component: ConversationListComponent},
    {path: 'conversations/:id/chat', component: ChatViewComponent},
    {path: 'conversations/:id/new', component: ConversationNewComponent},
    {path: 'users', component: UserListComponent},
    {path: 'users/:id', component: UserDetailsComponent}
];