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
