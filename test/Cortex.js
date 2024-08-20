const { loadFixture } = require ("@nomicfoundation/hardhat-network-helpers");
const { expect } = require("chai");
const { ethers } = require("hardhat");


describe("cortex", ()=>{
    async function deployFixture() {
        const[owner, otherAccount] = await ethers.getSigner();
        const CortexNFT = await ethers.getContractFactory("Cortex");
        const cortex = await CortexNFT.deploy();
        return {cortex, owner, otherAccount};    
    };
})