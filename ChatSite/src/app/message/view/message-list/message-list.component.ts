import { Component } from '@angular/core';
import { MessageService } from '../../service/message.service';
import { Messages } from '../../model/messages';
import { ActivatedRoute, RouterLink, RouterModule, RouterOutlet } from '@angular/router';
import { CommonModule, NgFor } from '@angular/common';

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
  currentUserId: string = "bbc53da7-849a-4b93-8822-9006c494ca62";

  constructor(private service: MessageService, private route: ActivatedRoute) {
  }

  messages: Messages | undefined;

  ngOnInit(): void {
    this.conversationId = this.route.snapshot.paramMap.get('id') ?? '';
    this.service.getMessagesInConversation(this.conversationId).subscribe(messages => this.messages = messages);
  }
}
