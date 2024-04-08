import { Component } from '@angular/core';
import { UserService } from '../../service/user.service';
import { CommonModule, NgIf } from '@angular/common';
import { Location } from '@angular/common';
import { ActivatedRoute } from '@angular/router';
import { UserDetails } from '../../model/user-details';

@Component({
  selector: 'app-user-details',
  standalone: true,
  imports: [CommonModule, NgIf],
  templateUrl: './user-details.component.html',
  styleUrl: './user-details.component.css',
  providers: [UserService]
})
export class UserDetailsComponent {
  userDetails: UserDetails = {
    id: "",
    name: "",
    email: "",
    sex: "",
    banned: false,
    emailConfirmed: false
  }

  constructor(private service: UserService, private route: ActivatedRoute, private location: Location) {
  }

  ngOnInit(): void {
    this.userDetails.id = this.route.snapshot.paramMap.get('id') ?? '';
    this.service.getUserDetails(this.userDetails.id).subscribe(userDetails => this.userDetails = userDetails)
  }
  
  goBack(): void {
    this.location.back();
  }

}
