package com.example;

import java.util.ArrayList;
import java.util.List;

public class Blockchain {

    private List<Block> chain;

    public Blockchain() {
        chain = new ArrayList<>();

        chain.add(createGenesisBlock());
    }

    private Block createGenesisBlock() {

        return new Block(
                0,
                "Genesis Block",
                "0"
        );
    }

    public Block getLatestBlock() {

        return chain.get(chain.size() - 1);
    }

    public void addBlock(String data) {

        Block previousBlock = getLatestBlock();

        Block newBlock = new Block(
                chain.size(),
                data,
                previousBlock.getHash()
        );

        chain.add(newBlock);
    }

    public List<Block> getChain() {

        return chain;
    }

    public boolean isChainValid() {

        for (int i = 1; i < chain.size(); i++) {

            Block currentBlock = chain.get(i);

            Block previousBlock = chain.get(i - 1);

            if (!currentBlock.getHash()
                    .equals(currentBlock.calculateHash())) {

                return false;
            }

            if (!currentBlock.getPreviousHash()
                    .equals(previousBlock.getHash())) {

                return false;
            }
        }

        return true;
    }
}