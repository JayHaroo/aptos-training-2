module user::voting{

    struct voterName {
        pub name: vector<u8>,
    }
    struct candidateName {
        pub name: vector<u8>,
    }
    struct candidateVotesCount {
        pub votes: u64,
    }

    struct Vote {
        pub candidate: u8,
        pub voter: address,
    }

    struct Candidate {
        pub name: vector<u8>,
        pub votes: u64,
    }

    Candidate candidate1 {
        name: b"Tecs Batitis",
        votes: 0,
    }
    Candidate candidate2 {
        name: b"Bronny James",
        votes: 0,
    }
    
    public entry fun setVoterName(name: vector<u8>) {
        voterName.name = name;
    }

    #[view]
    public fun getVoterName(): vector<u8> {
        return voterName.name;
    }

    public entry fun voteForCandidate(candidate: u8) {
        if (candidate == 1) {
            candidate1.votes = candidate1.votes + 1;
        } else if (candidate == 2) {
            candidate2.votes = candidate2.votes + 1;
        }
    }

    #[view]
    public fun getCandidateVotes(candidate: u8): u64 {
        if (candidate == 1) {
            return candidate1.votes;
        } else if (candidate == 2) {
            return candidate2.votes;
        }
        return 0;
    }

    
}