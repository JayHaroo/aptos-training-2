module user::voting{

    vector<u8> voterName;
    u64 candidateCount;
    vector<u8> candidateName;
    vector<u8> candidateVotesCount;

    struct Vote {
        pub candidate: u8,
        pub voter: address,
    }
    
    public entry fun setVoterName(name: vector<u8>) {
        voterName = name;
    }
}