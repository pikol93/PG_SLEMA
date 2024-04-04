import { Injectable } from '@angular/core';
import { RxStomp, RxStompConfig } from '@stomp/rx-stomp';

const myRxStompConfig: RxStompConfig = {
  brokerURL: '/chat-register',
  heartbeatIncoming: 0,
  heartbeatOutgoing: 20000,
  reconnectDelay: 200,
  debug: (msg: string): void => {
    console.log(new Date(), msg);
  },
};

export function createChatService(): ChatService {
  let service = new ChatService()
  service.configure(myRxStompConfig);
  service.activate();
  return service;
}

@Injectable()
export class ChatService extends RxStomp {

  constructor() {
    super();
   }
}
