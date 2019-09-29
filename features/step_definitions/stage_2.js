const assert = require("assert");
const { By } = require("selenium-webdriver");

module.exports = function() {
  this.When(/^preencher o campo "([^"]*)" com "([^"]*)"$/, async function(
    fieldName,
    CNPJ
  ) {
    await this.driver.findElement(By.id("identifier")).sendKeys(CNPJ);
  });

  this.When(/^remover o foco do campo$/, async function() {
    await this.driver.findElement(By.css(".step2-page > .row")).click();
  });

  this.Then(/^não irá exibir a mensagem "([^"]*)"$/, async function(
    invalidMessage
  ) {
    let messageExists = false;

    try {
      this.driver.findElement(By.css(".text-danger"));
      messageExists = true;
    } catch {}

    return !messageExists;
  });

  this.Then(/^irá exibir a mensagem "([^"]*)"$/, async function(
    invalidMessage
  ) {
    await this.driver.sleep(5000);
    let currentMessage = await this.driver
      .findElement(By.css(".text-danger"))
      .getText();
    return assert.equal(currentMessage, invalidMessage);
  });

  this.Then(/^o campo "([^"]*)" irá aparecer$/, async function(fieldName) {
    let messageExists = false;

    try {
      await this.driver.findElement(By.css(".row-bd label"));
      messageExists = true;
    } catch {}

    return messageExists;
  });

  this.Then(/^o campo "([^"]*)" não irá aparecer$/, async function(fieldName) {
    let messageExists = false;

    try {
      await this.driver.findElement(By.css(".row-bd label"));
      messageExists = true;
    } catch {}

    return !messageExists;
  });

  this.When(
    /^o formulário preenchido com "([^"]*)" e "([^"]*)"$/,
    async function(CNPJ, UF) {
      await this.driver.sleep(9000);
      await this.driver.findElement(By.id("identifier")).sendKeys(CNPJ);
      await this.driver.findElement(By.id("state")).click();
      const dropdown = await this.driver.findElement(By.id("state"));
      await dropdown.findElement(By.xpath(`//option[. = "${UF}"]`)).click();
      await this.driver.sleep(5000);
    }
  );

  this.Then(/^deverá exibir um alerta de erro "([^"]*)"$/, async function(
    message
  ) {
    await this.driver.sleep(5000);
    let currentMessage = await this.driver
      .findElement(By.css("a > .alert"))
      .getText();
    return assert.equal(currentMessage, message);
  });

  this.When(/^preencher a data de nascimento com "([^"]*)"$/, async function(
    birthday
  ) {
    await this.driver.findElement(By.id("birth_date")).click();
    await this.driver.findElement(By.id("birth_date")).sendKeys(birthday);
  });

  this.Then(/^deverá exibir "([^"]*)" mensagens de "([^"]*)"$/, async function(
    amount,
    message
  ) {
    let elements = await this.driver.findElements(By.css(".text-danger"));
    return elements.length == parseInt(amount);
  });
};
