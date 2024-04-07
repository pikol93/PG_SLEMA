import { Component, Input } from '@angular/core';
import { MessageService } from '../../service/message.service';
import { Messages } from '../../model/messages';
import { CommonModule, NgFor } from '@angular/common';
import { formatTime, formatDate } from '../../../utils/DateFormatUtils';

@Component({
  selector: 'app-message-list',
  standalone: true,
  imports: [CommonModule, NgFor],
  templateUrl: './message-list.component.html',
  styleUrl: './message-list.component.css',
  providers: [MessageService]
})
export class MessageListComponent {
  conversationId: string = "";
  @Input() currentUserId: string = "";

  @Input() messages: Messages | undefined;

  formatDate(dateTimeStr: string): string {
    return formatDate(dateTimeStr);
  }

  formatTime(dateTimeStr: string) : string {
    return formatTime(dateTimeStr);
  }
}
