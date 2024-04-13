import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/logic/repository/messages/messages_repository.dart';
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
  final String myID = ""; //TODO

  ThreadChatScreen(
      {super.key, required this.threadID, required this.threadTitle}) {
    messagesRepository = MessagesRepositoryImpl(threadID);
    messagesService = MessagesServiceImpl(messagesRepository);
  }

  @override
  State<ThreadChatScreen> createState() => _ThreadChatScreenState();
}

class _ThreadChatScreenState extends State<ThreadChatScreen> {
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
              stream: widget.messagesService.getHistoryStream(),
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
                  return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    prototypeItem: MessageBubble(
                      message: snapshot.data!.first.content,
                      isSentByMe: snapshot.data!.first.isSentByMe(widget.myID),
                    ),
                    itemBuilder: (context, index) {
                      return MessageBubble(
                        message: snapshot.data!.elementAt(index).content,
                        isSentByMe: snapshot.data!
                            .elementAt(index)
                            .isSentByMe(widget.myID),
                      );
                    },
                  );
                }
              },
            ),
          ),
          ChatMessageInput(onSendPressed: _onMessageSend),
        ],
      ),
    );
  }

  void _onMessageSend(String message) {
    setState(() {});
  }
}
