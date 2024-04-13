import { CommonModule, Location } from '@angular/common';
import { Component, Input } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { NewConversation } from '../../model/new-conversation';
import { ConversationService } from '../../service/conversation.service';
import { Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-conversation-new',
  standalone: true,
  imports: [CommonModule, FormsModule, ],
  templateUrl: './conversation-new.component.html',
  styleUrl: './conversation-new.component.css',
  providers: [ConversationService]
})
export class ConversationNewComponent {

  @Input("id") conversationId: string = "";

  title: string = "";
  content: string = "";
  userId: string = "bbc53da7-849a-4b93-8822-9006c494ca62";

  constructor(private service: ConversationService, private location: Location, private router: Router, private snackBar: MatSnackBar) {
    
  }

  ngOnInit(): void {

  }

  sendMessage(): void {
    if (!this.title || !this.content) {
      this.snackBar.open('Tytuł i treść nie mogą być puste.', 'Zamknij', { duration: 1500 });
      return;
    }

    let newConversation: NewConversation = {
      title: this.title,
      initiatorId: this.userId,
      message: {
        senderId: this.userId,
        content: this.content,
        dateTime: new Date(),
        conversationId: this.conversationId
      }
    };
    this.service.putConversation(this.conversationId, newConversation).subscribe(() => this.router.navigate(['/conversations']));
  }

  goBack(): void {
    this.location.back();
  }
}
