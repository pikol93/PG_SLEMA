import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Users } from '../model/users';
import { Observable } from 'rxjs';
import { UserDetails } from '../model/user-details';

@Injectable()
export class UserService {

  constructor(private http: HttpClient) { }
  
  
  getUsersInConversation(conversationId: string): Observable<Users> {
    return this.http.get<Users>(`/api/conversations/${conversationId}/users`)
  }
  
  getUsers(): Observable<Users> {
    return this.http.get<Users>(`/api/users`)
  }
  
  getUserDetails(userId: string): Observable<UserDetails> {
    return this.http.get<UserDetails>(`/api/users/${userId}`)
  }
}
