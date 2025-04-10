// lib/pages/about_page.dart

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'STT NURUL FIKRI\n\n'
        'STT Nurul Fikri adalah sebuah perguruan tinggi di Indonesia yang fokus pada '
        'pendidikan di bidang teknologi dan informatika. Kami berkomitmen untuk mencetak '
        'mahasiswa yang siap menghadapi tantangan industri dan memajukan teknologi di Indonesia.\n\n'
        'Aplikasi ini adalah bagian dari tugas praktikum yang dibuat oleh mahasiswa STT Nurul Fikri.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}