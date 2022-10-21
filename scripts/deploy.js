const hre = require("hardhat");
const fs = require("fs");

main = async () => {
  const Certi = await hre.ethers.getContractFactory("Certi");
  const certi = await Certi.deploy();

  await certi.deployed();

  console.log(
    `${certi.signer.address} deployed to ${certi.address}`
  );

  let details = {
    deployer: certi.signer.address,
    address: certi.address
  };

  fs.writeFile('./details.json', JSON.stringify(details), (err) => {
    if (err) {
      return console.log(err);
    }
    return console.log('Details are saved!!');
  })
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
