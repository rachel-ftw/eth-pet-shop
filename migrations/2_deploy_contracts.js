const Adoption = artifacts.require("./Adoptions.sol");

module.exports = deployer => {
  deployer.deploy(Adoption);
};
