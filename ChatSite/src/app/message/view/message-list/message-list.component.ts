import { Component } from '@angular/core';
import { MessageService } from '../../service/message.service';
import { Messages } from '../../model/messages';
import { ActivatedRoute } from '@angular/router';
import { CommonModule, NgFor } from '@angular/common';
import { Location } from '@angular/common';

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

  constructor(private service: MessageService, private route: ActivatedRoute, private location: Location) {
  }

  messages: Messages | undefined;

  ngOnInit(): void {
    this.conversationId = this.route.snapshot.paramMap.get('id') ?? '';
    this.service.getMessagesInConversation(this.conversationId).subscribe(messages => this.messages = messages);
  }

  goBack(): void {
    this.location.back();
  }

  formatDate(dateTimeStr: string): string {
    const currentDate = new Date();
    const messageDate = new Date(`${dateTimeStr}Z`);

    const diffTimeMs = Math.abs(currentDate.getTime() - messageDate.getTime()); 
    const diffDays = Math.floor(diffTimeMs / (1000 * 60 * 60 * 24));

    console.log(diffTimeMs)

    if (diffDays === 0) {
        return "Dziś";
    } else if (diffDays <= 7) {
        const daysOfWeek = ["NDZ", "PON", "WT", "ŚR", "CZW", "PT", "SOB"];
        const dayOfWeekIndex = messageDate.getDay();
        return daysOfWeek[dayOfWeekIndex];
    } else {
        const year = messageDate.getFullYear();
        const month = messageDate.getMonth() + 1;
        const day = messageDate.getDate();
        return `${day}.${month}.${year}`; // Zwróć datę w formacie dzień.miesiąc.rok
    }
}


  formatTime(dateTimeStr: string) : string {
    const dateTime = new Date(`${dateTimeStr}Z`);
    const hours = ('0' + dateTime.getHours()).slice(-2); // Dodanie zera do jednocyfrowej godziny
    const minutes = ('0' + dateTime.getMinutes()).slice(-2); // Dodanie zera do jednocyfrowej minuty
    return `${hours}:${minutes}`;
  }
}
