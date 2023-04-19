
const newSigners = ["0x4d4cdf0e5a2dc72f74eaf8bacb82025998d5193c", "0x9fd7590558bf1fe9e8e607cea006093b68fc52d5"]

for (let round = 0; round <= 16; round++) {
    for (const signer of clique.getSigners()) {
        miner.stop()
        miner.setEtherbase(signer);
        miner.start(1) //will work or fail, who cares, do it 16 times and the miners should be rotated
        for (let waiter = 0; waiter < 10000000; waiter++) {
            //ugly way of waiting a second or so
        }

        for(const newSigner of newSigners) {
            clique.propose(newSigner, true);
        }
        clique.propose(signer, newSigners.includes(signer)); //false for old signers
        
    }
}
