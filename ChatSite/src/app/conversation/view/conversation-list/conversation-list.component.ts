import { Component } from '@angular/core';
import { ConversationService } from '../../service/conversation.service';
import { Conversations } from '../../model/conversations';
import { CommonModule, NgFor } from '@angular/common';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-conversation-list',
  standalone: true,
  imports: [RouterLink, CommonModule, NgFor],
  templateUrl: './conversation-list.component.html',
  styleUrl: './conversation-list.component.css',
  providers: [ConversationService]
})
export class ConversationListComponent {

  constructor(private service: ConversationService) {
  }

  conversations: Conversations | undefined;

  ngOnInit(): void {
    this.service.getConversations().subscribe(conversations => this.conversations = conversations);
  }

}
