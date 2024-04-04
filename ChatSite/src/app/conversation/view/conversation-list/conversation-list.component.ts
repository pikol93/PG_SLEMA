import { Component } from '@angular/core';
import { ConversationService } from '../../service/conversation.service';
import { Conversations } from '../../model/conversations';
import { CommonModule, NgFor } from '@angular/common';
import { RouterLink } from '@angular/router';
import { formatDate, formatTime } from '../../../utils/DateFormatUtils';

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

  formatDate(dateTimeStr: string): string {
    return formatDate(dateTimeStr);
  }

  formatTime(dateTimeStr: string) : string {
    return formatTime(dateTimeStr);
  }
}
