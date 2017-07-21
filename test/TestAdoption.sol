pragma solidity ^0.4.11;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoptions.sol";

contract TestAdoption {
  Adoptions adoption = Adoptions(DeployedAddresses.Adoptions());

  function testUserCanAdoptPet() {
    uint returnedId = adoption.adopt(8);
    uint expected = 8;

    Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded");
  }

  function testGetAdopterAddressByPetId() {
    address expected = this;
    address adopter = adoption.adopters(8);

    Assert.equal(adopter, expected, "Owner of pet ID 8 should be recorded");
  }

  function testGetAdopterAddressByPedIdInArray() {
    address expected = this;
    address[16] memory adopters = adoption.getAdopters();

    Assert.equal(adopters[8], expected, "Owner of pet ID 8 should be recorded");
  }
}
