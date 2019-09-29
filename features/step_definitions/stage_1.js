const assert = require("assert");
const { By } = require("selenium-webdriver");

module.exports = function() {
  this.Given(/^que esteja na página de cadastro "([^"]*)"$/, function(url) {
    return this.driver.get(url);
  });

  this.When(/^preencher o campo E\-mail com "([^"]*)"$/, async function(email) {
    await this.driver.findElement(By.id("email")).sendKeys(email);
  });

  this.When(/^pressionar o botão "([^"]*)"$/, async function(button) {
    await this.driver.findElement(By.css(".btn-default")).click();
    await this.driver.sleep(8 * 1000);
  });

  this.Then(
    /^deverá redirecionar para página com o título "([^"]*)"$/,
    async function(titlePage) {
      let currentTitle = await this.driver.getTitle();
      return assert.equal(currentTitle, titlePage);
    }
  );

  this.Then(/^deverá exibir a mensagem "([^"]*)"$/, async function(
    invalidEmailMessage
  ) {
    let currentMessage = await this.driver
      .findElement(By.css(".text-danger"))
      .getText();
    return assert.equal(currentMessage, invalidEmailMessage);
  });

  this.Then(/^deverá exibir o erro  "([^"]*)"$/, async function(
    message
  ) {
    let currentMessage = await this.driver
      .findElement(By.css(".alert-danger"))
      .getText();
    return assert.equal(currentMessage, message);
  });
};
