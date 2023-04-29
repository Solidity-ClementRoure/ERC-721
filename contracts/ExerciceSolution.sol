pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is ERC721, IExerciceSolution {

    struct animal {
        uint256 sex;
        uint256 legs;
        bool wings;
        string name;
    }

	uint animalCounter;
	uint _registrationPrice = 10;

	mapping(uint256 => animal) animals;
	mapping(address => bool) breeders;

	mapping(uint256 => bool) _deadAnimals;
	mapping(uint256 => bool) _isAnimalForSale;
	mapping(uint256 => uint256) _animalPrice;

	address owner;
	address evaluator;
	address evaluator2;

    constructor(
        string memory _name,
        string memory _symbol,
        address _eval,
		address _eval2
    ) public ERC721(_name, _symbol) {

        owner = msg.sender;
		evaluator = _eval;
		evaluator2 = _eval2;

		animalCounter = 15;
		animals[animalCounter] = animal(1,2,true,"r69gNQSFUD5FO7o");
		_mint(evaluator, 15);

		breeders[evaluator] = true;
    }

    // Breeding function
	function isBreeder(address account) external override returns (bool) {
 
		return breeders[account];
	}

	function registrationPrice() external override returns (uint256) {

		return _registrationPrice;
	}

	function registerMeAsBreeder() external override payable{

		breeders[msg.sender] = true;
	}

	function declareAnimal(uint _sex, uint _legs, bool _wings, string calldata _name) external override returns (uint256){

		// require(breeders[msg.sender], "Sender is not allowed (not breeder)");

		animalCounter = 15;
		animals[animalCounter] = animal(_sex,_legs,_wings,_name);
		_mint(evaluator, animalCounter);

        return animalCounter;
	}

	function getAnimalCharacteristics(uint animalNumber) external override returns (string memory _name, bool _wings, uint _legs, uint _sex){

		return (
			animals[animalNumber].name,
			animals[animalNumber].wings,
			animals[animalNumber].legs,
			animals[animalNumber].sex
		);
	}

	function declareDeadAnimal(uint animalNumber) external override{

		// require(_exists(animalNumber), "Token doesn't exists.");
		// require(ownerOf(animalNumber) == msg.sender, "msg.sender does not own this token");

		if(_exists(animalNumber) && ownerOf(animalNumber) == msg.sender){

			_deadAnimals[animalNumber] = true;
			_burn(animalNumber);

			animals[animalNumber] = animal(0,0,false,"");
		}
	}

	function tokenOfOwnerByIndex(address owner, uint256 index) public override (ERC721, IExerciceSolution) view returns (uint256){
		return 0;
	}

	// Selling functions
	function isAnimalForSale(uint animalNumber) external override view returns (bool){

		return _isAnimalForSale[animalNumber];
	}

	function animalPrice(uint animalNumber) external override view returns (uint256){

		return _animalPrice[animalNumber];
	}

	function buyAnimal(uint animalNumber) external override payable {

		
	}

	function offerForSale(uint animalNumber, uint price) external override {

		
	}

	// Reproduction functions

	function declareAnimalWithParents(uint sex, uint legs, bool wings, string calldata name, uint parent1, uint parent2) external override returns (uint256){return 0;}

	function getParents(uint animalNumber) external override returns (uint256, uint256){return(0,0);}

	function canReproduce(uint animalNumber) external override returns (bool){return false;}

	function reproductionPrice(uint animalNumber) external override view returns (uint256){return 0;}

	function offerForReproduction(uint animalNumber, uint priceOfReproduction) external override returns (uint256){return 0;}

	function authorizedBreederToReproduce(uint animalNumber) external override returns (address){return address(0);}

	function payForReproduction(uint animalNumber) external override payable{}
}