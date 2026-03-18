const hre = require("hardhat");

async function main() {
  const GaslessToken = await hre.ethers.getContractFactory("GaslessToken");
  const token = await GaslessToken.deploy();

  await token.waitForDeployment();

  console.log(`GaslessToken deployed to: ${await token.getAddress()}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
