const { expect } = require('chai');
const { ethers } = require("hardhat");

describe('Calculator', function () {
  //Déclaration des variables, afin d'être pris en compte dans "beforeEach"
  let Calculator, calculator
  //Sinon on mettrait des this avant nos calculator et Calculator

  beforeEach(async function () {
    Calculator = await ethers.getContractFactory('Calculator')
    calculator = await Calculator.deploy()
    await calculator.deployed()
  });

  it('Should calculate the right result: addition', async function () {
    expect(await calculator.add(10, 5)).to.equal(15)
  })

  it('should calculate the right result: substraction', async function () {
    expect(await calculator.sub(10, 5)).to.equal(5)
  })

  it('Should calculate the right result: multiply', async function () {
    expect(await calculator.mul(10, 5)).to.equal(50)
  })

  it('Should calculate the right result: divide', async function () {
    expect(await calculator.div(10, 5)).to.equal(2)
  })

  it('Should revert if nb2 equals 0', async function () {
    await expect(calculator.div(10, 0)).to.be.revertedWith("Calculator: cannot divide by zero");
  });

  it('Should calculate the right result: modulo', async function () {
    expect(await calculator.mod(10, 5)).to.equal(0)
  })
})
