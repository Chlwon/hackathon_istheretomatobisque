import 'dart:async';
import 'package:flutter/material.dart';
import 'package:istheretomatobisque/yesno.dart';

class VotingProvider with ChangeNotifier {
  // Each location has its own pair of candidates
  final Map<int, List<Candidate>> _locationVotes = {
    1: [Candidate(id: '1', name: 'Yes'), Candidate(id: '2', name: 'No')],
    2: [Candidate(id: '3', name: 'Yes'), Candidate(id: '4', name: 'No')],
    3: [Candidate(id: '5', name: 'Yes'), Candidate(id: '6', name: 'No')],
    4: [Candidate(id: '7', name: 'Yes'), Candidate(id: '8', name: 'No')],
  };

  // Tracks the highlighted candidate for each location
  final Map<int, String?> _locationNames = {
    1: "Franklin Dining Commons",
    2: "Hampshire Dining Commons",                                     
    3: "Worcester Dining Commons",
    4: "Berkshire Dining Commons",
  };

  String getLocationName (int location) => _locationNames[location] ?? "Location $location";  
  
  final Map<int, String?> _selectedCandidateIds = {};

  List<Candidate> getCandidatesForLocation(int location) => _locationVotes[location]!;

  String? getSelectedCandidate(int location) => _selectedCandidateIds[location];

  void vote(int location, String candidateId) {
    final candidates = _locationVotes[location]!;
    for (var c in candidates) {
      if (c.id == candidateId) {
        c.votes++;
      }
    }
    _selectedCandidateIds[location] = candidateId;
    notifyListeners();

    // Reset highlight after 1 second
    Timer(const Duration(seconds: 1), () {
      _selectedCandidateIds[location] = null;
      notifyListeners();
    });
  }

  List<Candidate> winnersForLocation(int location) {
    final candidates = _locationVotes[location]!;
    if (candidates.isEmpty) return [];

    final highest = candidates.map((c) => c.votes).reduce((a, b) => a > b ? a : b);
    if (highest == 0) return [];

    return candidates.where((c) => c.votes == highest).toList();
  }

  bool isTieForLocation(int location) => winnersForLocation(location).length > 1;
  
  String getWinningOption(int location) {
    final winners = winnersForLocation(location);
    if (winners.isEmpty) return "Inconclusive";
    if (winners.length > 1) return "Inconclusive";
    return winners.first.name;
  }

  // ✅ Easy-to-use variables for external widgets
  String get winnerForLocation1 => getWinningOption(1);
  String get winnerForLocation2 => getWinningOption(2);
  String get winnerForLocation3 => getWinningOption(3);
  String get winnerForLocation4 => getWinningOption(4);

  finalAnswerForLocation(int location) {}
}

/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:istheretomatobisque/yesno.dart';

class VotingProvider with ChangeNotifier{
  List<Candidate> _candidates = [
    Candidate(id:'1', name: 'Yes'),
    Candidate(id:'2', name: 'No')
  ];

  String? selectedCandidateId;

  List<Candidate> get candidates => _candidates;

  void vote(String candidateId) {
    _candidates = _candidates.map((candidate) {
      if (candidate.id == candidateId) {
        candidate.votes += 1;
      }
      return candidate;
    }).toList();

    selectedCandidateId = candidateId;
    notifyListeners();
    Timer(const Duration(seconds:1), () {
      selectedCandidateId = null;
      notifyListeners();
    });
  }

  List <Candidate> get winners {
    if (_candidates.isEmpty) return [];

    int highestVotes = _candidates.map((c) => c.votes).reduce((a, b) => a > b ? a : b);

    if (highestVotes == 0) return [];

    List <Candidate> topCandidates = _candidates.where((c) => c.votes == highestVotes).toList();

    return topCandidates;
  }

  bool get isTie => winners.length > 1;
}
*/