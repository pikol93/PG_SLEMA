import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service.dart';
import 'package:pg_slema/features/chat/presentation/controller/add_thread_controller.dart';
import 'package:pg_slema/features/chat/presentation/screen/thread_chat_screen.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_input.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/forms/text_input.dart';
import 'package:pg_slema/utils/widgets/unfocus_on_children_tap.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/thread.dart';

class AddThreadScreen extends StatefulWidget {
  final AddThreadController controller;
  final ThreadsService threadsService;
  final VoidCallback onThreadAdded;
  const AddThreadScreen(
      {super.key,
      required this.controller,
      required this.threadsService,
      required this.onThreadAdded});

  @override
  State<AddThreadScreen> createState() => _AddThreadScreenState();
}

class _AddThreadScreenState extends State<AddThreadScreen> with Logger {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: UnfocusOnChildrenTap(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const DefaultAppBar(title: "Utwórz wątek"),
              DefaultBody(
                child: Column(
                  children: [
                    Container(height: 20),
                    CustomTextFormField(
                      onChanged: _onThreadNameChanged,
                      label: "Nazwij wątek",
                    ),
                  ],
                ),
              ),
              ChatMessageInput(onSendPressed: _onThreadAdded),
            ],
          ),
        ),
      ),
    );
  }

  void _onThreadNameChanged(String newName) {
    widget.controller.threadTitle = newName.trim(); //Blank messages not allowed
  }

  Future<void> _onThreadAdded(String message) async {
    widget.controller.message = message.trim(); //Blank messages not allowed
    //Additional validation using form
    if ((_formKey.currentState?.validate() ?? true) &
        widget.controller.isValid()) {
      //TODO Get user
      if (mounted) {
        context.loaderOverlay.show();
      }

      Thread t = widget.controller.createNewThreadWithRandomID();
      Response? response = await widget.threadsService
          .createThread(t, "54c53da7-849a-4b93-8822-9006c494ca62");

      if (mounted) {
        context.loaderOverlay.hide();
      }

      if (isResponseCorrect(response) == false) {
        return;
      }

      widget.onThreadAdded();
      _moveToThreadChatScreen(t.id, t.title);
    }
  }

  bool isResponseCorrect(Response? response) {
    if (response == null) {
      return false;
    }
    if (response.statusCode == null) {
      logger.error("Reponse status code is null. "
          "As stated in the Dio library - "
          "this only happens when creating Response manually "
          "- shouldn't happen.");
      return false;
    }
    if (response.statusCode == 400) {
      logger.error("Status code response == 400."
          " This may be caused by lack of title or message,"
          "however UI shouldn't let it happen");
      return false;
    }

    return true;
  }

  void _moveToThreadChatScreen(String threadID, String threadTitle) {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ThreadChatScreen(
                  threadID: threadID,
                  threadTitle: threadTitle,
                )));
  }
}
