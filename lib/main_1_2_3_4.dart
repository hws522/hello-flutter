import 'package:flutter/material.dart';
// import 'package:hello_flutter/widget/Button.dart';
// import 'package:hello_flutter/widget/currency_card.dart';

void main() {
  runApp(const App());
}

// ! stateless widget
// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           backgroundColor: const Color(0xff181818),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 80,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           const Text(
//                             'Hey, Selena',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 28,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Text(
//                             'Welcome back',
//                             style: TextStyle(
//                               color: Colors.white.withOpacity(0.8),
//                               fontSize: 18,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 70,
//                   ),
//                   Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       fontSize: 22,
//                       color: Colors.white.withOpacity(0.8),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Text(
//                     '\$5 194 482',
//                     style: TextStyle(
//                       fontSize: 44,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Button(
//                           text: 'Transfer',
//                           bgColor: Color(0xfff1b33b),
//                           textColor: Colors.black),
//                       Button(
//                           text: 'Request',
//                           bgColor: Color(0xff1f2123),
//                           textColor: Colors.white),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 100,
//                   ),
//                   Row(
//                     // crossAxisAlignment: CrossAxisAlignment.end,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         'Wallets',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         'View All',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.8),
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const CurrencyCard(
//                     name: 'Euro',
//                     code: 'EUR',
//                     amount: '6 428',
//                     icon: Icons.euro_rounded,
//                     isInverted: false,
//                   ),
//                   Transform.translate(
//                     offset: const Offset(0, -30),
//                     child: const CurrencyCard(
//                       name: 'Bitcoin',
//                       code: 'BTC',
//                       amount: '9 785',
//                       icon: Icons.currency_bitcoin,
//                       isInverted: true,
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: const Offset(0, -60),
//                     child: const CurrencyCard(
//                       name: 'Dollar',
//                       code: 'USD',
//                       amount: '428',
//                       icon: Icons.attach_money_outlined,
//                       isInverted: false,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }

// ! stateful widget
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: const Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyLargeTitle(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
