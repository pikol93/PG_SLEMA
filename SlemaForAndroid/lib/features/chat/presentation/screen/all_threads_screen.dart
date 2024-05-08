import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service_impl.dart';
import 'package:pg_slema/features/chat/presentation/screen/partial/available_threads.dart';
import 'package:pg_slema/features/chat/presentation/screen/partial/login_view.dart';
import 'package:pg_slema/features/chat/presentation/screen/partial/no_threads_found.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/features/chat/logic/repository/threads/threads_repository_impl.dart';
import 'package:pg_slema/utils/widgets/vertically_centered/vertically_centered_spinkit.dart';

class AllThreadsScreen extends StatefulWidget {
  const AllThreadsScreen({super.key});

  @override
  State<AllThreadsScreen> createState() => _AllThreadsScreenState();
}

class _AllThreadsScreenState extends State<AllThreadsScreen> {
  final ThreadsService threadsService =
      ThreadsServiceImpl(ThreadsRepositoryImpl());
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );
  bool isSignedIn = false;
  bool isLoading = true;

  Future<void> checkIfSignedIn() async {
    googleSignIn.signOut();
    isSignedIn = await googleSignIn.isSignedIn();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> signInWithGoogle() async{
    GoogleSignInAccount? account = await googleSignIn.signIn();
    setState(() {
      isSignedIn = account != null;
      print(account?.email);
    });
  }

  @override
  void initState(){
    super.initState();
    checkIfSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WhiteAppBar(
          titleText: "Konsultacje",
        ),
        if(isLoading)...[
          const VerticallyCenteredSpinkit(),
        ]
        else if (!isSignedIn) ...[
          LoginView(onGoogleSignInPressed: signInWithGoogle,)
        ]
        else if (threadsService.isAnyThreadAvailable()) ...[
          AvailableThreads(threadsService: threadsService),
        ] else ...[
          const DefaultBody(child: NoThreadsFound()),
        ]
      ],
    );
  }
}
