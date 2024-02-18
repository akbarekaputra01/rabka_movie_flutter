import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabka_movie/provider/idVidePlay_provider.dart';
import 'package:rabka_movie/utils/colors.dart';

class ThumbnailVideo extends StatefulWidget {
  final String keyVideo;

  const ThumbnailVideo({super.key, required this.keyVideo});

  @override
  State<ThumbnailVideo> createState() => _ThumbnailVideoState();
}

class _ThumbnailVideoState extends State<ThumbnailVideo> {
  @override
  Widget build(BuildContext context) {
    final isVidPlayProvider = Provider.of<IsVidPlayProvider>(context);
    bool _isVidPlay = isVidPlayProvider.isVidPlay;

    return Stack(
      children: [
        Image.network(
          'https://img.youtube.com/vi/${widget.keyVideo}/0.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              setState(() {
                isVidPlayProvider.setIsVidPlay(_isVidPlay);
              });
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor, // Sesuaikan warna sesuai kebutuhan
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white, // Sesuaikan warna ikon sesuai kebutuhan
                size: 40, // Sesuaikan ukuran ikon sesuai kebutuhan
              ),
            ),
          ),
        )
      ],
    );
  }
}