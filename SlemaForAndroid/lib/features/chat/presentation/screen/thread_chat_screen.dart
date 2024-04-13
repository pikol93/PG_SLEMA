import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/logic/repository/messages/messages_repository_impl.dart';
import 'package:pg_slema/features/chat/logic/service/messages/messages_service_impl.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_input.dart';
import 'package:pg_slema/utils/widgets/unfocus_on_children_tap.dart';
import 'package:pg_slema/features/chat/logic/service/messages/messages_service.dart';
import 'package:pg_slema/features/chat/presentation/widget/message_bubble/message_bubble.dart';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';
import 'package:pg_slema/utils/widgets/vertically_centered/vertically_centered_spinkit.dart';
import 'package:pg_slema/utils/widgets/vertically_centered/vertically_centered_text_information.dart';

class ThreadChatScreen extends StatefulWidget {
  late final MessagesRepositoryImpl messagesRepository; //TODO sus
  late final MessagesService messagesService; //TODO sus
  final String threadID;
  final String threadTitle;
  final String myID = "54c53da7-849a-4b93-8822-9006c494ca62"; //TODO

  ThreadChatScreen(
      {super.key, required this.threadID, required this.threadTitle}) {
    messagesRepository = MessagesRepositoryImpl(threadID);
    messagesService = MessagesServiceImpl(messagesRepository);
  }

  @override
  State<ThreadChatScreen> createState() => _ThreadChatScreenState();
}

class _ThreadChatScreenState extends State<ThreadChatScreen> {
  final ScrollController _listScrollController = ScrollController();
  late StreamController<List<ChatMessage>> _historyMessagesStreamController;
  late StreamController<ChatMessage> _newMessageStreamController;
  List<ChatMessage> _allMessages = [];
  @override
  void initState() {
    super.initState();
    _historyMessagesStreamController =
        widget.messagesService.getHistoryStream();
    _newMessageStreamController = widget.messagesService.getLastMessageStream();
    _newMessageStreamController.stream.listen(_onMessageGet);
  }

  @override
  void dispose() {
    widget.messagesRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusOnChildrenTap(
      child: Column(
        children: [
          DefaultAppBar(title: widget.threadTitle),
          DefaultBody(
            child: StreamBuilder(
              stream: _historyMessagesStreamController.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ChatMessage>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const VerticallyCenteredSpinkit();
                } else if (snapshot.hasError) {
                  return const VerticallyCenteredTextInformation(
                      textInformation:
                          'Błąd podczas pobierania informacji, spróbuj ponownie.');
                } else if (!snapshot.hasData) {
                  return const Text("No data");
                } else {
                  _allMessages = snapshot.data ?? [];
                  Widget listView = ListView.builder(
                      controller: _listScrollController,
                      itemCount: _allMessages.length,
                      prototypeItem: MessageBubble(
                        message: _allMessages.first.content,
                        isSentByMe: _allMessages.first.isSentByMe(widget.myID),
                      ),
                      itemBuilder: (context, index) {
                        return MessageBubble(
                          message: _allMessages.elementAt(index).content,
                          isSentByMe: _allMessages
                              .elementAt(index)
                              .isSentByMe(widget.myID),
                        );
                      });

                  _scrollDownListView();
                  return listView;
                }
              },
            ),
          ),
          ChatMessageInput(onSendPressed: _onMessageSend),
        ],
      ),
    );
  }

  void _scrollDownListView() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final position = _listScrollController.position.maxScrollExtent;
      _listScrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _onMessageSend(String message) {
    //TODO should it be here?
    ChatMessage m =
        ChatMessage(widget.myID, "TODO Sendername", message, DateTime.now());
    widget.messagesService.sendMessage(m);
  }

  void _onMessageGet(ChatMessage newMessage) {
    setState(() {
      _allMessages.add(newMessage);
    });
  }
}
