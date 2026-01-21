import 'package:flutter/material.dart';

class AppPerformanceEmojis extends StatelessWidget {
  final void Function(String emoji) onSelected;

  const AppPerformanceEmojis({super.key, required this.onSelected});

  static const Map<String, List<Map<String, String>>> emojiCategories = {
    '🏆 Craque': [
      {'emoji': '👑', 'word': 'Rei do Jogo'},
      {'emoji': '🔥', 'word': 'Camisa 10'},
      {'emoji': '⚽', 'word': 'Dono da Bola'},
      {'emoji': '💪', 'word': 'Brabo'},
      {'emoji': '🏅', 'word': 'MVP'},
    ],
    '😬 Muito Mal': [
      {'emoji': '🐭', 'word': 'Pé de Rato'},
      {'emoji': '🩴', 'word': 'Chinelinho'},
      {'emoji': '🐟', 'word': 'Cabeça de Bagre'},
      {'emoji': '🎁', 'word': 'Entrega Jogo'},
      {'emoji': '🤦', 'word': 'Fominha Sem Noção'},
    ],
    '🛡️ Defensor': [
      {'emoji': '🚧', 'word': 'Muralha'},
      {'emoji': '👮', 'word': 'Xerife'},
      {'emoji': '🦾', 'word': 'Monstro da Defesa'},
      {'emoji': '🔒', 'word': 'Impassável'},
      {'emoji': '🦁', 'word': 'Rei do Bote'},
    ],
    '🥅 Melhor Goleiro': [
      {'emoji': '🧤', 'word': 'Mão de Ouro'},
      {'emoji': '🏰', 'word': 'Paredão'},
      {'emoji': '🐱', 'word': 'Gato'},
      {'emoji': '✈️', 'word': 'Voa que Nem o Alisson'},
      {'emoji': '🦾', 'word': 'Luvas de Aço'},
    ],
    '🎯 Finalizador+': [
      {'emoji': '🎯', 'word': 'Matador'},
      {'emoji': '⚽', 'word': 'Artilheiro Nato'},
      {'emoji': '💀', 'word': 'Letal'},
      {'emoji': '🚀', 'word': 'Imparável'},
      {'emoji': '🎩', 'word': 'O Cara do Gol'},
    ],
    '🏃 Volante': [
      {'emoji': '⚙️', 'word': 'Motorzinho'},
      {'emoji': '💨', 'word': 'Pulmão do Time'},
      {'emoji': '🐕‍🦺', 'word': 'Pitbull'},
      {'emoji': '🔄', 'word': 'Incansável'},
      {'emoji': '🃏', 'word': 'Coringa'},
    ],
    '🎨 Driblador+': [
      {'emoji': '✨', 'word': 'Mago da Bola'},
      {'emoji': '🌀', 'word': 'Rei do Drible'},
      {'emoji': '🎩', 'word': 'Faz Mágica'},
      {'emoji': '😎', 'word': 'Abusado'},
      {'emoji': '💃', 'word': 'Bailarino'},
    ],
    '🔥 Raçudo': [
      {'emoji': '⚔️', 'word': 'Guerreiro'},
      {'emoji': '💯', 'word': 'Nunca Desiste'},
      {'emoji': '🦁', 'word': 'Leão de Campo'},
      {'emoji': '❤️👟', 'word': 'Coração na Chuteira'},
      {'emoji': '🚀', 'word': 'Vai Até o Fim'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: emojiCategories.length,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(16),
            //   child: Text(
            //     'Avaliação do Atleta',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).colorScheme.onSurface,
              unselectedLabelColor:
                  Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              indicatorColor: Theme.of(context).colorScheme.primary,
              tabs: emojiCategories.keys.map((category) {
                return Tab(text: category);
              }).toList(),
            ),
            const Divider(height: 1),
            Expanded(
              child: TabBarView(
                children: emojiCategories.values.map((emojiList) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GridView.builder(
                      itemCount: emojiList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final emoji = emojiList[index]['emoji']!;
                        final word = emojiList[index]['word']!;
                        return GestureDetector(
                          onTap: () {
                            onSelected(emoji);
                            Navigator.pop(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                emoji,
                                style: const TextStyle(fontSize: 24),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                word,
                                style: const TextStyle(fontSize: 10),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
