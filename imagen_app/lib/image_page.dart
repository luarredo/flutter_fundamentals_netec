import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  Future<String> _loadImage() async {
    await Future.delayed(const Duration(seconds: 5));
    return 'https://i.pinimg.com/736x/b0/f5/b3/b0f5b3b28957b46b38df6806f3aa91e3.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image App'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/itachi.webp',
              height: 300,
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: _loadImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Image.network(
                    snapshot.data as String,
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 300,
                      height: 300,
                      color: Colors.white,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
