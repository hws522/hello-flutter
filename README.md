# hello-flutter

<br>
<br>

## 2.3 Hello World

- 모든 것은 위젯이다. 블록처럼 위젯에 위젯을 쌓아가며 앱을 만드는 것.

- 위젯은 외우지 말고 찾아보며 사용하자. https://docs.flutter.dev/development/ui/widgets

- 모든 위젯은 build 메서드를 사용해야한다.(build 또한 자동 완성 가능)

- 앱의 root Widget 은 두 개의 옵션 중 하나를 return 해야 한다.

  CupertinoApp(애플의 디자인 시스템) 혹은 MaterialApp(구글의 디자인 시스템) 중에 선택해야 한다.

  이는 우리가 어떤 family style 을 사용할 지 flutter 에게 말해주는 것이다.

  내가 구글이나 애플의 디자인을 따라하지 않고 새로운 나만의 디자인을 하고 싶다 하더라도, app 의 root 이자 시작점이기에 기본 UI 설정과 같은 재료들을 선택해 줘야만 한다.

  flutter 는 구글이 만들었기 때문에 MaterialApp 이 훨씬 보기 좋으니 MaterialApp 을 쓰자.

- 모든 화면은 Scaffold(구조)를 가져야 한다.

<br>

## 2.4 Recap

EVERYTHING IS WIDGET

**`모든 것이 위젯`** 이다.

전부 위젯에 관한 내용이고 완전 선언형이다.

클래스를 위젯으로 바꿔주기 위해 flutter 의 core widget 중 하나인 StatelessWidget 을 상속받았다.

아주 기초적인 위젯이고 화면에 뭔가를 띄워주는 것 말고는 하는 일이 없다.

위젯이 된다는 건 계약을 맺는 것이다. 그 계약은 바로 build 메소드를 구현해야 한다는 것이다.

앱을 시작할 때 뜨는 첫번째 widget 은 앱의 root 라고 할 수 있다.

앱의 root 는 material 혹은 Cupertino 디자인 중 하나를 선택해서 리턴해야 한다.

모든 것이 위젯이라고 하지만, 그저 dart 의 class 를 사용하고 있다는 걸 알아야 한다.

<br>

## 2.5 Classes Recap

flutter 는 완전 객체지향 프레임워크다.

모든 게 다 class 라는 뜻이고 모든 widget 은 class 다.

어떤 widget 이건, 마우스를 올리면 constructor 를 볼 수 있고, 이 것들을 읽을 줄 알아야 한다.

우리는 widget 을 사용할 때마다 class 를 인스턴스화 하고 있다.

dart 는 `new` 를 써줄 필요가 없다. 쓰던 안쓰던 똑같기 때문이다.

`new` 를 다 쓴다면, 아래와 같다.

```dart
void main() {
  runApp(new App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Hello Flutter!'),
        ),
        body: new Center(
          child: new Text('Hello World!'),
        ),
      ),
    );
  }
}
```

우리가 사용하는 Text class 같은 데서 볼 수 있는 constructor(생성자) 가 아래와 같다.

positional parameter 라고 한다. argument 의 위치가 중요하다.

```dart
class Player {
  String name;
  Player(this.name);
}

void main() {
  var testPlayer = Player('test');
  // testPlayer.name => test
  runApp(App());
}
```

다른 종류의 constructor 는 named parameter 라는 것이다.

home, appBar, title 등이 이와 같다.

파라미터가 많을 땐 순서를 잊어버리기 쉽기에 위의 방법과 같이 하지 않는다.

대신 이름에 기반하여 사용한다.

```dart
class Player {
  String name;
  Player({required this.name});
}

void main() {
  var testPlayer = Player(name: 'test');
  // testPlayer.name => test
  runApp(App());
}
```

`?` 를 추가하면 Player 가 name 을 가질 수도, 가지지 않을 수도 있다고 정의한다.

```dart
class Player {
  String? name;
  Player();
}
```

<br>

## 3.0 Header

```dart
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xff181818),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

```

하나의 함수 안에 모두 다 넣을 수 있지만, 코드가 굉장히 더럽다.

가독성이 매우 떨어진다.

이대로는 점점 더 길어지고 복잡해져서 작업하기 힘들 것이다.

<br>

## 3.1 Developer Tools

제목은 `Developer Tools` 라고 되어 있지만

`Column` 과 `Row` 라는 두가지 Widget 을 배웠던 것을 다시금 정리했다.

(여기서는 `Column` 과 `Row` 를 내가 알던 개념의 반대로 설명해주고 있다.

서로 **상-하로 놓고 싶을 때는 Column** 을 사용하고, **좌-우로 놓고 싶을 때는 Row** 를 사용한다고 한다.

무튼 이 부분이 내가 알던 개념이랑 달라서 적어놔야겠다 싶어서 이렇게 따로 써놓는다. 굳이 따지지 않고 넘어가려고 한다.)

`Row` 와 `Column` 은 `MainAxis` 와 `CrossAxis` 를 가지고 있다.

Row 의 MainAxis 는 수평(가로)방향이다.

Row 의 CrossAxis sms 수직(세로)방향이다.

Column 의 MainAxis 는 수직(세로)방향이다.

Column 의 CrossAxis 는 수평(가로)방향이다.

=> `Row` 에서는 `가로`가 Main, `Column` 에서는 `세로`가 Main 이다.

`space(간격)` 를 주기 위해서는 `SizedBox` 를 사용해야 한다.

색상을 주기 위해서는 `Colors` 를 사용해야 한다. 직접 외부에서 가져온 색을 입력해 넣을 수도 있고, 팔레트에 있는 색상을 사용할 수도 있다.

`Layout` 이 헷갈린다면, 개발자 도구를 사용하면 된다.

내부에 어떤 위젯이 있는지, 어떻게 설정되어 있는지 쉽게 알 수 있다.

<br>

## 3.2 Buttons Section

`Container` 라는 Widget 을 사용한다.

`Container` 는 `<div>` 같은 것이다. child 를 가지고 있는 단순한 box.

앞으로 자주 사용할 것이다.

```dart
...
Row(
  children: [
    Container(
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(
            45,
          )),
      child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Text(
            'Transfer',
            style: TextStyle(
              fontSize: 20,
            ),
          )),
    )
  ],
)
...
```

<br>

## 3.3 VSCode Settings

vscode 에서 작업을 하다보면, 파란색 줄로 경고문이 나타나는것을 확인할 수 있다.

마우스를 올려보면, 이런 경고가 나타난다.

```
Use 'const' with the constructor to improve performance.
Try adding the 'const' keyword to the constructor invocation.dart(prefer_const_constructors)
```

Dart 는 constant(상수) 개념을 지원한다.

constant(상수)로 값을 지정하게 되면, 컴파일전에 그 value(값)을 알 수 있기 때문에 컴파일러는 변수를 위한 메모리 공간을 만드는 대신, 상수를 계산해서 대체하게된다.

이는 훨씬 더 나은 코드를 만들어 준다.

경고문처럼 실제로 값이 바뀌지 않을 예정이라면 constant 로 만드는 것이 더 나을 수도 있다. const 를 추가하게되면 바로 파란색 줄이 사라지게 된다.

런타임 대신 컴파일러가 컴파일 중에 값을 산정할 수 있으므로 app 이 동작하는데 더 쉽다.

하지만 어떤 것은 상수가 될 수 있고, 어떤 것은 될 수 없는지 기억하고 있는 것은 쉽지 않기 때문에 vscode 설정을 통해 해결하도록 한다.

```json
...
"editor.codeActionsOnSave": {
    "source.fixAll": true
  }
...
```

<br>

## 3.4 Code Actions

`Code Actions` 는 코드를 매우 간단한 방법으로 리팩토링하게 해준다.

예를 들어 기존코드에서 Text 를 padding 안에 넣는다던지, Row 안에 Text 를 넣는다던지, Row 나 Col 을 감싸는 상위에 padding 을 추가하는 등의 작업을 할 때 Container 를 만들고 child 에 붙여넣기하는 식의 수동으로 코드를 수정한다.

이 과정이 귀찮고 실수를 하기 쉽기 때문에, 코드 우측에 보이는 전구를 누르면 보이는 Code Actions 를 이용한다.

마우스로 전구를 직접 클릭해도 되지만, 마우스 호버시 보이는 단축키를 이용할 수도 있다.(command + .)

<br>

## 3.5 Reusable Widgets

반복 사용되는 위젯을 재사용이 가능하도록 만들 수 있다.

main 이 아닌 widget 폴더에 위젯으로 사용할 버튼을 클래스로 생성한다.

모든 위젯은 각자 나름대로의 build 메소드를 실행시켜야만 한다.

배경 색상, 텍스트 색상, 텍스트 내용을 전송해서 재사용하기 위해 아래처럼 코드를 작성한다.

```dart
// button.dart
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(
            45,
          )),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
            ),
          )),
    );
  }
}
```

위의 위젯도 클래스일 뿐이다.

Dart 에서 만든 클래스처럼 프로퍼티들을 추가해주는 작업을 했다.

타입을 설정한 후, 생성자 함수에 넣기만 하면 된다.

<br>

## 3.6 Cards

```dart
...
Container(
  decoration: BoxDecoration(
    color: const Color(0xff1f2123),
    borderRadius: BorderRadius.circular(25),
  ),
  child: Padding(
    padding: const EdgeInsets.all(30),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Euro',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  '6 428',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'EUR',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    ),
  ))
```

<br>

## 3.7 Icons and Transforms

`Transform` 을 이용하면, `Transform` 내부 child 의 크기나 위치를 변경할 수 있다.

아이콘의 크기를 직접 키우게 되면, 해당 아이콘을 감싸는 카드의 크기가 같이 커져서 원하는 이미지를 만들 수 없다.

`Transform` 을 이용해서 아이콘의 크기만을 키운 후, 상위 컨테이너의 `clipBehavior` 속성을 이용하면 하위 위젯들의 크기가 커졌을 경우 보이지 않도록 할 수 있다.

```dart
...
Container(
  clipBehavior: Clip.hardEdge,
...
  Transform.scale(
    scale: 2.2,
    child: Transform.translate(
      offset: const Offset(-5, 12),
      child: const Icon(
        Icons.euro_rounded,
        color: Colors.white,
        size: 88,
      ),
  ))
)
```

<br>

## 3.8 Reusable Cards

하단에 위치하는 카드들을 재사용 가능한 위젯을 이용하기 위해 위젯을 생성한다.

생성과 동시에 재사용할 때 필요할만한 데이터들을 정하고 해당 데이터들을 property 로 만든다.

그리고 code action 이나 직접 생성자를 만든다.

색상반전을 표현하기 위해 반전을 체크하는 임의의 property(isInverted) 를 만든다.

그 후 하드코딩된, 재사용 시 property 가 들어갈 자리에 property 로 값을 수정해준다.

반전 색상을 지정할 때 삼항연산자를 이용해 지정하는데 이때 색상을 그대로 복사붙여넣기 하는 것 보단 상위에서 변수로 색상을 지정하여 쓰면 깔끔하다. 이때 `_` 를 붙여서 private 하게 만들겠다는 것을 의미한다.

```dart
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  final _blackColor = const Color(0xff1f2123);
  final _whiteColor = const Color(0xffffffff);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? _whiteColor : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? _blackColor : _whiteColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : _whiteColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.scale(
                  scale: 2.2,
                  child: Transform.translate(
                    offset: const Offset(-5, 12),
                    child: Icon(
                      icon,
                      color: isInverted ? _blackColor : _whiteColor,
                      size: 88,
                    ),
                  ))
            ],
          ),
        ));
  }
}
```

카드 위젯을 여러개 넣다보면 에러가 발생한다. 화면을 벗어나기 때문이다.

화면을 넘쳐흐르는 UI 를 만들 때 화면을 스크롤링할 수 있도록 만들 수 있다.

app 을 감싸는 body 에 `SingleChildScrollView` 위젯을 사용하면 스크롤이 가능하다.

```dart
Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xff181818),
          body: SingleChildScrollView(
            child: Padding(
              ...
            )
            ...
          )
          ...
        )
      ...
    )
  ...
}
```

카드가 겹쳐있는듯한 느낌을 주려면 Transform.translate 위젯을 이용하면 된다.

```dart
...
  Transform.translate(
    offset: const Offset(0, -30),
    child: const CurrencyCard(
      name: 'Bitcoin',
      code: 'BTC',
      amount: '9 785',
      icon: Icons.currency_bitcoin,
      isInverted: true,
    ),
  ),
...
```

<br>

## 4.0 State

**Stateful Widget**

지금까지는 `Stateless Widget` 을 사용했다.

`Stateless Widget` 은 매우 간단하다.

build 메서드를 통해 그저 UI 를 출력할 뿐이다.

`Stateful Widget` 은 상태를 가지고 있어서 Stateful 로 불린다.

Stateful widget 은 두 파트로 나뉜다.

첫번째는 상태가 없는 위젯 그 자체다.

두번째는 위젯의 상태(state)로, 위젯의 state 는 데이터와 UI 를 가지고 있는 부분이다.

그리고 Stateful Widget 의 데이터는 dart class property 일 뿐이다.

아래는 간단히 클릭한 횟수를 화면에 그려주는 state 를 구현한 코드이다.

```dart
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    counter = counter + 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              IconButton(
                iconSize: 40,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

<br>

## 4.1 setState

State 를 가지고 있는 `StatefulWidget` 을 만들었다.

```dart
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ...
}
```

그리고 State 에 UI 를 넣고 데이터도 넣었다.

```dart
class _AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ...
    );
  }
}
```

데이터도 수정했다.

```dart
...
void onClicked() {
    counter = counter + 1;
  }
...
```

하지만 `setState` 함수를 호출하지 않는다면, `build` 메서드는 다시 실행되지 않는다. 플러터는 게으르기 때문이다.

`setState` 함수는 State 클래스에게 데이터가 변경되었다고 알리는 함수다.

```dart
int counter = 0;

void onClicked() {
  setState(() {
    counter = counter + 1;
  });
}
```

위처럼 setState 함수를 이용해 flutter 의 위젯에게 새로운 데이터가 있다고 알려주는 것이다.

그러면 flutter 는 build 메서드를 다시 실행한다.

setState 는 기본적으로 새로운 데이터와 함께 build 메서드를 한 번 더 호출하는 것이다.

데이터의 변화를 무조건 setState 내부에 넣을 필요는 없지만, 가독성이 더 좋기 때문에 권장된다.

<br>

## 4.2 Recap

setState 함수를 이용해 flutter 는 build 메서드를 다시 실행한다.

setState 함수를 사용하지 않으면, onClicked 함수 내부에 console.log 로 확인 시 counter 값은 업데이트 되는 것이 확인 되지만 화면은 업데이트 되지 않는다.

데이터의 업데이트가 build 메서드를 다시 실행하지는 않기 때문이다.

react 와는 다르게, 더 좋은 위젯들을 사용할 것이기 때문에 state 를 자주 사용하지는 않는다.

<br>

## 4.3 BuildContext

`BuildContext` 를 이용하면 색상, 크기, 글자 굵기 등 app 의 모든 스타일적인 요소를 한곳에서 지정할 수 있다.

`theme: ThemData` 를 이용해서 원하는 스타일을 지정한다.

theme 를 만들면, 해당 theme 은 애플리케이션 위젯의 state 에 있다는 것을 알 수 있다.

그리고 그 애플리케이션 위젯의 state 는 MyLargeTitle 이라는 자식을 가지고 있다.

MyLargeTitle 에서 theme 값에 접근 하려면, BuildContext 를 이용한다.

부모에게 직접 접근하는 것이다.

위젯 트리에 대해 알아야하는데, flutter 가 어떻게 렌더링 되는지 알 수 있다.

위젯 트리 상으로 MyLargeTitle 은 아래로 5단계를 내려가야 한다.

context 는 Text 이전에 있는 모든 상위 요소들에 대한 정보다.

context 는 MyLargeTitle Text 의 부모 요소들의 모든 정보를 담고 있다.

즉 context 는 위젯 트리에 대한 정보가 담겨있고, 매우 먼 요소의 데이터를 가져올 수 있기 때문에 유용하다.

context 를 이용해서 해당 위젯이 어떤 위젯이고, 부모 요소는 무엇인지 알 수 있고 그 상위 부모 요소에도 접근할 수 있다.

아래처럼 `Theme.of(context).textTheme.titleLarge` 이런 식으로 불러온다.

```dart
...
class _AppState extends State<App> {
  ...
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
      ...
    );
  }
}

class MyLargeTitle extends StatelessWidget {
  ...
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
```

정리하면, BuildContext 는 위젯 트리에서 위젯의 위치를 제공하고 이를 통해 상위 요소 데이터에 접근할 수 있다.

<br>

## 4.4 Widget Lifecycle

`StatefulWidget` 은 살아있다.

이게 무슨말이냐하면, react 처럼 `생명주기(Lifecycle)`를 가지고 있다는 것이다.

생명주기는 여러 메서드들에 반응하는데, 그 중 가장 중요한 건 `initState`, `dispose`, `build` 다.

build 는 위젯에서 UI 를 만든다.

initState 는 build 이전에 호출되며, 변수를 초기화하며 api update 구독 등을 할 수 있게 해준다. 그 후 build 가 호출된다.

dispose 는 위젯이 위젯 트리에서 제거될 때 실행된다. 여기서는 이벤트 리스너 같은 것들을 구독 취소하는 것이다.

외울필요는 없고, 그저 이러한 것들이 widget life cycle 이라는 것을 알아야한다는 것 뿐이다.

```dart
...
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

```

<br>

## 5.0 User Interface

`POMODORO APP` 을 만들어본다.

`Scaffold` body 에 Column 을 넣고 children 배열을 `Flexible` 로 구성한다.

`Flexible` 은 UI 를 하드코딩이 아닌, `비율에 기반`에서 더 유연하게 만들 수 있도록 해준다.

아래처럼 `Flexible` 은 상위 박스 내부의 박스들 중, 하나의 박스가 얼마나 공간을 차지할 지 비율을 정할 수 있다.

```dart
class _HomeScreenState extends State<HomeScreen> {

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
       children: [
         Flexible(
           flex: 1,
           child: Container(
             ...
           ),
         ),
         Flexible(
           flex: 2,
           child: Container(
             ...
           ),
         ),
         Flexible(
           flex: 1,
           child: Container(
             ...
           ),
         ),
       ]
     ),
   );
 }
}
```

`Expanded` 을 이용하면 하위 `child` 에 들어가는 `container` 를 끝까지 확장시켜서 사용할 수 있다.

```dart
Flexible(
  flex: 1,
  child: Row(
    children: [
      Expanded(
        child: Container(
        ...
        )
      ),
    ],
  ),
)
```

<br>
