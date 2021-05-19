//import { ethers } from "hardhat";
const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("GalaxyShare", function () {
  before(async function () {
    this.GalaxyToken = await ethers.getContractFactory("GalaxyToken");
    this.GalaxyShare = await ethers.getContractFactory("GalaxyShare");

    this.signers = await ethers.getSigners();
    this.alice = this.signers[0];
    this.bob = this.signers[1];
    this.carol = this.signers[2];
  });

  beforeEach(async function () {
    this.galaxy = await this.GalaxyToken.deploy();
    this.share = await this.GalaxyShare.deploy(this.galaxy.address);
    this.galaxy.mint(this.alice.address, "100");
    this.galaxy.mint(this.bob.address, "100");
    this.galaxy.mint(this.carol.address, "100");
  });

  it("should not allow enter if not enough approve", async function () {
    await expect(this.share.enter("100")).to.be.revertedWith(
      "ERC20: transfer amount exceeds allowance"
    );

    await this.galaxy.approve(this.share.address, "50");
    await expect(this.share.enter("100")).to.be.revertedWith(
      "ERC20: transfer amount exceeds allowance"
    );

    await this.galaxy.approve(this.share.address, "100");
    await this.share.enter("100");
    expect(await this.share.balanceOf(this.alice.address)).to.equal("100");
  });

  it("should not allow withraw more than what you have", async function () {
    await this.galaxy.approve(this.share.address, "100");
    await this.share.enter("100");
    await expect(this.share.leave("200")).to.be.revertedWith(
      "ERC20: burn amount exceeds balance"
    );
  });

  it("should work with more than one participant", async function () {
    //approve
    await this.galaxy.approve(this.share.address, "100");
    await this.galaxy
      .connect(this.bob)
      .approve(this.share.address, "100", { from: this.bob.address });
    await this.galaxy
      .connect(this.carol)
      .approve(this.share.address, "100", { from: this.carol.address });

    // Alice enters and gets 20 shares. Bob enters and gets 10 shares.
    await this.share.enter("20");
    await this.share.connect(this.bob).enter("10", { from: this.bob.address });
    expect(await this.share.balanceOf(this.alice.address)).to.equal("20");
    // Bob's xGALA = 10 * 20 / 20 = 10
    expect(await this.share.balanceOf(this.bob.address)).to.equal("10");
    expect(await this.galaxy.balanceOf(this.share.address)).to.equal("30");

    // galaxyshare get 20 more galaxys from an external source.
    await this.galaxy
      .connect(this.carol)
      .transfer(this.share.address, "20", { from: this.carol.address });

    // Alice deposits 10 more galaxys. She should receive 10*30/50 = 6 shares.
    await this.share.enter("10");
    expect(await this.share.balanceOf(this.alice.address)).to.equal("26");
    expect(await this.share.balanceOf(this.bob.address)).to.equal("10");
    // Bob withdraws 5 shares. He should receive 5*60/36 = 8 shares
    await this.share.connect(this.bob).leave("5", { from: this.bob.address });
    expect(await this.share.balanceOf(this.alice.address)).to.equal("26");
    expect(await this.share.balanceOf(this.bob.address)).to.equal("5");
    expect(await this.galaxy.balanceOf(this.share.address)).to.equal("52");
    expect(await this.galaxy.balanceOf(this.alice.address)).to.equal("70");
    expect(await this.galaxy.balanceOf(this.bob.address)).to.equal("98");
  });
});
