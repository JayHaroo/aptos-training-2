module user::voting {
    use std::vector;
    use std::signer;

    struct Candidate has key {
        name: vector<u8>,
        votes: u64,
    }

    struct Voter has key {
        has_voted: bool,
    }

    struct VotingState has key {
        candidate1: Candidate,
        candidate2: Candidate,
    }

    public fun initialize(admin: &signer) {
        assert!(!exists<VotingState>(signer::address_of(admin)), 1);
        move_to(admin, VotingState {
            candidate1: Candidate { name: b"Tecs Batitis", votes: 0 },
            candidate2: Candidate { name: b"Bronny James", votes: 0 },
        });
    }

    public entry fun vote(s: &signer, candidate: u8) {
        let voter_addr = signer::address_of(s);

        assert!(!exists<Voter>(voter_addr), 2);
        move_to(s, Voter { has_voted: true });

        let state = borrow_global_mut<VotingState>(voter_addr);
        if (candidate == 1) {
            state.candidate1.votes = state.candidate1.votes + 1;
        } else if (candidate == 2) {
            state.candidate2.votes = state.candidate2.votes + 1;
        } else {
            assert!(false, 3); // Invalid candidate
        }
    }

    public fun get_votes(addr: address, candidate: u8): u64 {
        let state = borrow_global<VotingState>(addr);
        if (candidate == 1) {
            return state.candidate1.votes;
        } else if (candidate == 2) {
            return state.candidate2.votes;
        }
        0
    }
}
