import 'package:flutter/material.dart'; // !! 회원권 디자인 사진 새로 가져오기!! //

class Membership extends StatelessWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '회원권 및 결제',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Basic 요금제',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              PhotoButton(
                imagePath: 'assets/shutterstock_2370887283.jpg',
                onPressed: () {},
                buttonSize: const Size(350, 160),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Standard 요금제',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              PhotoButton(
                imagePath: 'assets/shutterstock_1999254680.jpg',
                onPressed: () {},
                buttonSize: const Size(350, 160),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Premium 요금제',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              PhotoButton(
                imagePath: 'assets/shutterstock_2272957247.jpg',
                onPressed: () {},
                buttonSize: const Size(350, 160),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final Size buttonSize;
  const PhotoButton(
      {super.key,
      required this.imagePath,
      required this.onPressed,
      required this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: buttonSize.width,
        height: buttonSize.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(30.0), // Adjust the radius as needed
            ),
          ),
          onPressed: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
