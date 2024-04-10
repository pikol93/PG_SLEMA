import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConversationNewComponent } from './conversation-new.component';

describe('ConversationNewComponent', () => {
  let component: ConversationNewComponent;
  let fixture: ComponentFixture<ConversationNewComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ConversationNewComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ConversationNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
