import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/logic/entity/thread.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';
import 'package:intl/intl.dart';

class AvailableThreadOverview extends StatelessWidget {
  final Thread thread;
  final double senderNameWidthRatio = 0.25;
  const AvailableThreadOverview({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: DefaultContainer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  thread.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                thread.lastMessage.dateTime.toDateString(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width *
                        senderNameWidthRatio),
                child: Text(
                  "${thread.lastMessage.senderName}:",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        height: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(width: 3),
              Expanded(
                child: Text(
                  thread.lastMessage.content,
                  style: Theme.of(context).textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(width: 3),
              Text(
                DateFormat('hh:mm').format(thread.lastMessage.dateTime),
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
