import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Conversations } from '../model/conversations';
import { NewConversation } from '../model/new-conversation';

@Injectable()
export class ConversationService {

  constructor(private http: HttpClient) { }

  getConversations(): Observable<Conversations> {
    return this.http.get<Conversations>(`/api/conversations`);
  }

  getInitatedConversationsForUser(userId: string): Observable<Conversations>{
    return this.http.get<Conversations>(`/api/users/${userId}/conversations?role=initiator`);
  }

  getParticipatedConversationsForUser(userId: string): Observable<Conversations>{
    return this.http.get<Conversations>(`/api/users/${userId}/conversations?role=participant`);
  }
  
  putConversation(uuid: string, conversation: NewConversation) : Observable<any> {
    return this.http.put<void>(`/api/conversations/${uuid}`, conversation);
  }
}
