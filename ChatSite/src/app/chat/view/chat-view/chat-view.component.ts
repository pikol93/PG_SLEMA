import { CommonModule, NgFor} from '@angular/common';
import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Messages } from '../../../message/model/messages';
import { Location } from '@angular/common';
import { formatTime, formatDate } from '../../../utils/DateFormatUtils';
import { ChatMessage } from '../../model/chat-message';
import { ChatService, createChatService } from '../../service/chat.service';
import { Message as StompMessage } from '@stomp/stompjs';
import { Subscription } from 'rxjs';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-chat-view',
  standalone: true,
  imports: [CommonModule, NgFor, FormsModule],
  templateUrl: './chat-view.component.html',
  styleUrl: './chat-view.component.css',
  providers: [{
    provide: ChatService,
    useFactory: createChatService}]
})
export class ChatViewComponent {
  conversationId: string = "";
  messageContent: string = "";
  currentUserId: string = "bbc53da7-849a-4b93-8822-9006c494ca62";
  conversationTitle: string = "Nowa";
  messages: Messages = {
    messages: []
  };
  subscribedTopics: Subscription[] = [];

  constructor(private service: ChatService, private route: ActivatedRoute, private location: Location) {
  }

  ngOnInit(): void {
    this.conversationId = this.route.snapshot.paramMap.get('id') ?? '';
    let historyTopic = this.service.watch({destination: `/user/topic/messages/${this.conversationId}`}).subscribe((message: StompMessage) => {
      this.messages = JSON.parse(message.body);
    })
    this.subscribedTopics.push(historyTopic);
    let newMessagesTopic = this.service.watch({destination: `/topic/messages/${this.conversationId}`}).subscribe((message: StompMessage) => {
      this.messages.messages.push(JSON.parse(message.body));
    })
    this.subscribedTopics.push(newMessagesTopic);
  }

  goBack(): void {
    this.location.back();
  }

  sendMessage(): void {
    let chatMessage : ChatMessage = {
      senderId: this.currentUserId,
      conversation: {
        id: this.conversationId,
        title: this.conversationTitle
      },
      content: this.messageContent,
      dateTime: new Date(),
    }
    this.service.publish({
      destination: `/app/chat/${this.conversationId}`,
      body: JSON.stringify(chatMessage),
    });
    this.messageContent = ""
  }

  formatDate(dateTimeStr: string): string {
    return formatDate(dateTimeStr);
  }

  formatTime(dateTimeStr: string) : string {
    return formatTime(dateTimeStr);
  }

  ngOnDestroy(): void {
    this.subscribedTopics.forEach(topic => {
      topic.unsubscribe();
    });
  }
}