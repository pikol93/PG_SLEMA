import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Conversations } from '../model/conversations';

@Injectable()
export class ConversationService {

  constructor(private http: HttpClient) { }

  getConversations(): Observable<Conversations> {
    return this.http.get<Conversations>(`/api/conversations`);
  }
}
