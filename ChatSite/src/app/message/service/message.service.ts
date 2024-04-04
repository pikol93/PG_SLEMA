import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Messages } from '../model/messages';

@Injectable()
export class MessageService {

  constructor(private http: HttpClient) { 
  }
  
  getMessagesInConversation(conversationId: string): Observable<Messages> {
    return this.http.get<Messages>(`/api/conversations/${conversationId}/messages`)
  }
}
