import { TestBed } from '@angular/core/testing';

import { ConversationService } from './conversation.service';

describe('ServiceService', () => {
  let service: ConversationService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ConversationService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
