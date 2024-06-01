// Fetch and display the message from the user and the AI
// Ho Thanh Duy 21110759
import 'dart:convert';
import 'package:coffee_ui/view/BingAI/widgets/example_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../constraint/colors.dart';
import '../../entity/conversation.dart';
import 'widgets/chat_list_view.dart';
import 'widgets/chat_text_field.dart';

class BingAI extends StatefulWidget {
  const BingAI({super.key});
  static const String routeName = "/bingAI";

  @override
  State<BingAI> createState() => _HomePageState();
}

class _HomePageState extends State<BingAI> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];

  bool get isConversationStarted => conversations.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.background,
        elevation: 0,
        title: Text(
          "CafeGPT",
          style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 38),
                    if (!isConversationStarted) ...[
                      Image.asset("assets/images/logo.png"),
                      const SizedBox(height: 24),
                      Text(
                        "Welcome to\nCafeGPT",
                        style: textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Ask anything, get your answer",
                          style: textTheme.bodyMedium?.copyWith(color: Colors.white)
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.wb_sunny_outlined, color: Colors.white,),
                              const SizedBox(height: 6),
                              Text(
                                "Examples",
                                style: textTheme.titleMedium?.copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 40),
                              const ExampleWidget(
                                  text:
                                  "“Explain quantum computing in simple terms”"),
                              const ExampleWidget(
                                  text:
                                      "“Got any creative ideas for a 10 year old’s birthday?”"),
                              const ExampleWidget(
                                  text:
                                      "“How do I make an HTTP request in Javascript?”"),
                            ],
                          ),
                        ),
                      ),
                    ] else
                      Expanded(child: ChatListView(conversations: conversations)),
                    ChatTextField(
                        controller: controller,
                        onSubmitted: (question) {
                          controller.clear();
                          FocusScope.of(context).unfocus();
                          conversations.add(Conversation(question!, ""));
                          setState(() {});
                          post(Uri.parse("http://10.0.2.2:8000/get-response"),
                                  body: jsonEncode({"text": question}),
                                  headers: {"Content-Type": "application/json"})
                              .then((response) {
                            String result = jsonDecode(response.body)['response'];
                            conversations.last =
                                Conversation(conversations.last.question, result);
                            setState(() {});
                          });
                        }),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
