import { Component } from '@angular/core';
import { CommonModule, NgFor } from '@angular/common';
import { RouterLink } from '@angular/router';
import { formatDate, formatTime } from '../../../utils/DateFormatUtils';
import { UserService } from '../../service/user.service';
import { Users } from '../../model/users';

@Component({
  selector: 'app-user-list',
  standalone: true,
  imports: [RouterLink, CommonModule, NgFor],
  templateUrl: './user-list.component.html',
  styleUrl: './user-list.component.css',
  providers: [UserService]
})
export class UserListComponent {

  constructor(private service: UserService) {
  }

  users: Users = {
    users: []
  }

  ngOnInit(): void {
    this.service.getUsers().subscribe(users => this.users = users);
  }
}
