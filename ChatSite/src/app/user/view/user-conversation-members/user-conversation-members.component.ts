import { Component, Input } from '@angular/core';
import { Users } from '../../model/users';
import { NgFor, NgIf } from '@angular/common';
import { ChatMembers } from '../../../chat/model/chat-members';

@Component({
  selector: 'app-user-conversation-members',
  standalone: true,
  imports: [NgFor, NgIf],
  templateUrl: './user-conversation-members.component.html',
  styleUrl: './user-conversation-members.component.css'
})
export class UserConversationMembersComponent {

  @Input() members: ChatMembers = {
    members: []
  }

}
