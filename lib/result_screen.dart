import 'package:flutter/material.dart';
import 'package:istheretomatobisque/voting_provider.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Voting Results"),
        backgroundColor: const Color.fromARGB(255, 136, 28, 28),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (int location = 1; location <= 4; location++) ...[
            // Location header with final answer
            Text(
              '${votingProvider.getLocationName(location)}: ${votingProvider.finalAnswerForLocation(location) ?? "No vote"}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Candidate list for this location
            ...votingProvider.getCandidatesForLocation(location).map((c) {
              final winners = votingProvider.winnersForLocation(location);
              final isWinner = winners.contains(c);

              return ListTile(
                title: Text(
                  c.name,
                  style: TextStyle(
                    fontWeight: isWinner ? FontWeight.bold : FontWeight.normal,
                    color: isWinner ? Colors.green : Colors.black,
                  ),
                ),
                trailing: Text('Votes: ${c.votes}'),
                subtitle: isWinner
                    ? Text(
                        votingProvider.isTieForLocation(location)
                            ? "Inconclusive"
                            : "Verdict",
                      )
                    : null,
              );
            }),
            const Divider(),
          ],
        ],
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:istheretomatobisque/voting_provider.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Voting Results")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (int location = 1; location <= 4; location++) ...[
            Text(
              '${votingProvider.getLocationName(location)} Results',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...votingProvider.getCandidatesForLocation(location).map((c) {
              final winners = votingProvider.winnersForLocation(location);
              final isWinner = winners.contains(c);
              return ListTile(
                title: Text(
                  c.name,
                  style: TextStyle(
                    fontWeight: isWinner ? FontWeight.bold : FontWeight.normal,
                    color: isWinner ? Colors.green : Colors.black,
                  ),
                ),
                trailing: Text('Votes: ${c.votes}'),
                subtitle: isWinner
                    ? Text(
                        votingProvider.isTieForLocation(location)
                            ? "Inconclusive"
                            : "Verdict",
                      )
                    : null,
              );
            }),
            const Divider(),
          ],
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:istheretomatobisque/voting_provider.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final votingProvider = Provider.of<VotingProvider>(context);
    final isTie = votingProvider.isTie;
    final winners = votingProvider.winners;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Voting Results"),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(
              itemCount: votingProvider.candidates.length,
              itemBuilder: (context, index) {
                final candidate = votingProvider.candidates[index];
                final isWinner = winners.contains(candidate);

                return ListTile(
                  title: Text(candidate.name, style: TextStyle(fontWeight: isWinner?FontWeight.bold:FontWeight.normal, 
                  color: isWinner? Colors.green: Colors.black)
                  ),
                  trailing: Text("Votes: ${candidate.votes}"),
                  subtitle: isWinner ? Text(isTie? "Inconclusive":"Verdict") : null,
                );
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(16), child: Text(
            isTie? "Inconclusive":"Verdict", 
            style: TextStyle(fontWeight: FontWeight.bold, color: isTie? Colors.red: Colors.green)))
          
        ],
      )
    );
  }
}
*/