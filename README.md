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
