import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

//앱의 시작하는 부분
void main() => runApp( MyInsaApp());

// 시작 클래스. 머터리얼 디자인 앱 생성
class MyInsaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(), // 표시할 화면의 인스턴스
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  final _pages = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //상단
      appBar: AppBar(
        title: const Text("복잡한 UI"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            padding: const EdgeInsets.only(right: 30),
          )
        ],
      ),
      //중단
      body: _pages[_index],
      //하단
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index; //
          });
        },
        currentIndex: _index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: '이용서비스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '내 정보',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // 상하스크롤 생성
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  //상단 (아이콘으로 생성)
  Widget _buildTop() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //row 줄(일정간격) 꽉채우기
            children: [
              GestureDetector(
                //클릭 기능 -
                onTap: () {
                  print('택시');
                },
                child: Column(
                  children: const <Widget>[
                    Icon(
                      Icons.local_car_wash,
                      size: 40,
                    ),
                    Text('택시'),
                  ],
                ),
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_car_wash,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_car_wash,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_car_wash,
                    size: 40,
                  ),
                  Text('대리'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //row 줄(일정간격) 꽉채우기
            children: [
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_car_wash,
                    size: 40,
                  ),
                  Text('택시'),
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_car_wash,
                    size: 40,
                  ),
                  Text('블랙'),
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.local_car_wash,
                    size: 40,
                  ),
                  Text('바이크'),
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: const <Widget>[
                    Icon(
                      Icons.local_car_wash,
                      size: 40,
                    ),
                    Text('대리'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //중단 (슬라이드 생성)
  Widget _buildMiddle() {
    final dummyImage = [
      '../img/1.jpg',
      '../img/2.jpg',
      '../img/3.jpg',
      '../img/4.jpg',
      '../img/5.jpg',
    ];
    return CarouselSlider(
      options: CarouselOptions(height: 150.0, autoPlay: true), //높이,자동슬라이스
      items: dummyImage.map((url) {
        //페이지수
        return Builder(
          builder: (BuildContext context) {
            //context 사용할때
            return Container(
              width: MediaQuery.of(context).size.width, // 기기의 가로길이
              margin: EdgeInsets.symmetric(horizontal: 5.0), // 좌우여백
              decoration: const BoxDecoration(color: Colors.white), // 배경색
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              )
            );
          },
        );
      }).toList(),
    );
  }

  //하단
  Widget _buildBottom() {
    final items = List.generate(20, (i){
      return ListTile(
        leading: Icon(Icons.notifications_none),
        title: Text('[이벤트] 이것은 공지사항입니다.'),
      );
    });
    return
      ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: items,
      );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '내 정보',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
