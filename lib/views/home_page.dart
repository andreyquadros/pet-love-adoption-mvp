import 'package:flutter/material.dart';
import 'package:petloveadoption/views/components/card_pet.dart';
import '../models/Pet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'PetLove Adoption',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardPet(
                pet: Pet(
                    name: 'Bella',
                    photoUrl: 'https://images.pexels.com/photos/14116837/pexels-photo-14116837.jpeg?_gl=1*qo1cnd*_ga*OTg2Mzk3MDgxLjE3NjI5NzU5Nzk.*_ga_8JE65Q40S6*czE3NjI5NzU5NzgkbzEkZzEkdDE3NjI5NzU5OTgkajQwJGwwJGgw',
                    localAssetAlt: 'images/beagle.jpeg',
                    size: 'Médio',
                    temperament: 'Dócil')),
            CardPet(
                pet: Pet(
                    name: 'Golden',
                    photoUrl: 'https://images.pexels.com/photos/2253275/pexels-photo-2253275.jpeg',
                    localAssetAlt: 'images/golden.jpg',
                    size: 'Grande',
                    temperament: 'Dócil')),
          ],
        ),
      ),
    );
  }
}
