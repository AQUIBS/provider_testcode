import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_testcode/provider/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final numberController = TextEditingController();
late int title;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        child: ChangeNotifierProvider<HomePageProvider>(
          create: (context) => HomePageProvider(),
          child:
              Consumer<HomePageProvider>(builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provider.elgibilityMessage.toString(),
                  style: TextStyle(
                      color: (provider.isEligible == true
                          ? Colors.green
                          : Colors.red),
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your age",
                    border: const OutlineInputBorder(),
                    suffixIcon: numberController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            onPressed: () {
                              numberController.clear();
                            },
                            icon: const Icon(Icons.close),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.checkEligibility(
                        int.parse(numberController.text),
                      );
                    },
                    child: const Text("Check"))
              ],
            );
          }),
        ),
      ),
    );
  }
}
