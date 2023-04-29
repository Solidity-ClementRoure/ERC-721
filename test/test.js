// ganache-cli \ --fork https://goerli.infura.io/v3/a12b4dfeb504407c9b995c6a773e3800 --unlock 0x589563701c2270930f57fdCaa84aEdCBb891622A --unlock 0x40aDC5976f6ae451Dbf9a390d31c7ffB5366b229
// truffle test debug --network goerli_fork test/test.js

const IERC20 = artifacts.require("IERC20");
const ExerciceSolution = artifacts.require("ExerciceSolution");
const IExerciceSolution = artifacts.require("IExerciceSolution");
const ERC20TD = artifacts.require("ERC20TD");
const Evaluator = artifacts.require("Evaluator");

contract("ExerciceSolution", (accounts)=>{

    const METAMASK = "0x589563701c2270930f57fdCaa84aEdCBb891622A";
    const EVALUATOR = "0x40aDC5976f6ae451Dbf9a390d31c7ffB5366b229";

    it("Should declare dead animal", async()=>{

        const exerciceSolution = await ExerciceSolution.new("Clement NFT", "NFT", "0x40aDC5976f6ae451Dbf9a390d31c7ffB5366b229", "0x0E4F5184E6f87b5F959aeE5a09a2797e8B1b20E5");

        await exerciceSolution.declareDeadAnimal(
            15,
            {
            from: EVALUATOR,
            }
        );

    //    const evaluator = await Evaluator.new("0xDF4D64b1716856e2F995Df7eb512740Ac33Da55E");

    //    await evaluator.submitExercice(
    //       exerciceSolution.address,
    //       {
    //         from: METAMASK,
    //         gas:3000000
    //       }
    //    );

    });
});

