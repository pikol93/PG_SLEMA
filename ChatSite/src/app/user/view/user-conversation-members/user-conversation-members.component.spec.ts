import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserConversationMembersComponent } from './user-conversation-members.component';

describe('UserConversationMembersComponent', () => {
  let component: UserConversationMembersComponent;
  let fixture: ComponentFixture<UserConversationMembersComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [UserConversationMembersComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(UserConversationMembersComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
