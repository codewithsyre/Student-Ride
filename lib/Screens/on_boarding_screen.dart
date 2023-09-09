import 'package:flutter/material.dart';
import 'register.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color.fromARGB(255, 114, 154, 248),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 31, 89, 108),
              Color.fromARGB(255, 14, 4, 35),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: demo_data.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => OnBoardContent(
                        image: demo_data[index].image,
                        title: demo_data[index].title,
                        description: demo_data[index].description,
                        isLastPage: index == demo_data.length - 1,
                        onStartBooking: () {
                          // Navigate to HomePage when the "Start Booking" button is pressed
                        }),
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(
                        demo_data.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: DotIndicator(
                                isActive: index == _pageIndex,
                              ),
                            )),
                    Spacer(),
                    SizedBox(
                      height: 30,
                      width: 85,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pageIndex < demo_data.length - 1) {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          } else {
                            // Navigate to HomePage when on the last page
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 86, 154, 166),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFFFAFDFF), Color(0xFF519FBC), Color(0xFF41484A)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> demo_data = [
  OnBoard(
    image: "assets/image.png",
    title: 'University of Limpopo Student Ride',
    description: '',
  ),
  OnBoard(
    image: "assets/image1.jpg",
    title: 'Pick Location',
    description:
        'Let the driver know where your destination point is located on the map',
  ),
  OnBoard(
    image: "assets/image2.jpg",
    title: 'Confirm Destination',
    description:
        'Confirm possible destination route, preferred time slot for departure ',
  ),
  OnBoard(
    image: "assets/image3.jpg",
    title: 'Track Your Ride',
    description:
        'Know your driver in advance and be able to view your current location in real time on the map',
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    this.image,
    this.title,
    this.description,
    this.isLastPage = false,
    this.onStartBooking,
  }) : super(key: key);

  final image, title, description;
  final bool isLastPage;
  final VoidCallback? onStartBooking;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: 350,
          width: 350,
        ),
        SizedBox(
          height: 100,
        ),
        Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.40,
            letterSpacing: 0.20,
          ),
        ),
        Spacer(),
        if (isLastPage) // Show the button only on the last page
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Start Booking',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        Spacer(),
      ],
    );
  }
}
