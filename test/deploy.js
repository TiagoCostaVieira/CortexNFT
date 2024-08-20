const {ethers} = require("hardhat");


async function main() {
    const MyCortex = await ethers.getContractFactory("Cortex");
    const cortexNTF = MyCortex.deploy();

    await MyCortex.waitForDeployment();
    const address = await MyCortex.getAddress(); 

    console.log(`Contract CortexNFT deployed to ${address}`);
}

main().catch((erro) =>{
    console.error(error);
    process.exitCode = 1;
});