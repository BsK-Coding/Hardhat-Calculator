const { expect } = require('chai');

describe('Calculator', () => {

  beforeEach(async () => {
    const Calculator = await ethers.getContractFactory('Calculator')
    const calculator = await Calculator.deploy()
    await calculator.deployed()
  });

  describe('Addition', () => {
    it('Should add 2 numbers', async () => {
      expect(await calculator.add(nb1, nb2)).to.equal(nb1 + nb2)
    })
  })

  describe('Soustraction', () => {
    it('should sub 2 numbers', async () => {
      expect(await calculator.sub(nb1, nb2)).to.equal(nb1 - nb2)
    })
  })

  describe('Multiplication', () => {
    it('Should multiply 2 numbers', async () => {
      expect(await calculator.mul(nb1, nb2)).to.equal(nb1 * nb2)
    })
  })

  describe('Division', () => {
    it('Should divide 2 numbers', async () => {
      expect(await calculator.div(nb1, nb2)).to.equal(nb1 / nb2)
    })
  })

  describe('Modulo', () => {
    it('Should give the remainder of a division of 2 numbers ', async () => {
      expect(await calculator.mod(nb1, nb2)).to.equal(nb1 % nb2)
    })
  })
})
