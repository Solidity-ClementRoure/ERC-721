
var ExerciceSolution = artifacts.require("ExerciceSolution.sol");

module.exports = (deployer, network, accounts) => {
    deployer.then(async () => {
		await deployer.deploy(
			ExerciceSolution, "Clement NFT", "NFT", "0x40aDC5976f6ae451Dbf9a390d31c7ffB5366b229", "0x0E4F5184E6f87b5F959aeE5a09a2797e8B1b20E5"
		);
    });
};