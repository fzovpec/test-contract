import { time, loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";
import { toUtf8Bytes } from "ethers/lib/utils";

describe("Game", () => {
  it("New Scores For New Game Intialized. Should Return 0", async () => {
    const Game = await ethers.getContractFactory("Game");
    const game = await Game.deploy();
    await game.deployed();

    const name = ethers.utils.hexZeroPad(toUtf8Bytes("fzovpec"), 32)
    expect(await game.getScores(name, 0)).to.equal([{
        "_hex": "0x00",
        "_isBigNumber": true
      },
      {
        "_hex": "0x00",
        "_isBigNumber": true
      },
    ]);
  });
  it("Scores for a particular game updated. Shouldn't affect the scores of the other game", async () => {
    const Game = await ethers.getContractFactory("Game");
    const game = await Game.deploy();

    const name = ethers.utils.hexZeroPad(toUtf8Bytes("fzovpec"), 32);
    await game.updateScores(name, 0, 1, 0);

    expect(await game.getScores(name, 0)).to.equal([{
        "_hex": "0x01",
        "_isBigNumber": true
      },
      {
        "_hex": "0x00",
        "_isBigNumber": true
      },
    ]);
  });
});