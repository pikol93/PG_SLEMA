import { Routes } from '@angular/router';
import { ConversationListComponent } from './conversation/view/conversation-list/conversation-list.component';

export const routes: Routes = [
    {path: 'conversations', component: ConversationListComponent}
];