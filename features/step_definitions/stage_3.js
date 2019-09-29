const assert = require("assert");
const { By } = require("selenium-webdriver");

module.exports = function() {
  this.Given(/^que esteja na etapa 3 do cadastro$/, async function () {
    await this.driver.get("https://qa-web.tilix.com.br/cadastro/etapa-1");
    await this.driver.sleep(5000)
    await this.driver.findElement(By.id("email")).sendKeys("brenoborges@email.com");
    await this.driver.findElement(By.css(".btn-default")).click();
    await this.driver.sleep(5000)
  });

  this.When(/^preencher os campos nome e sobrenome com caracteres"([^"]*)" e "([^"]*)"$/,async function (name,family_name) {
    await this.driver.sleep(5000);
    await this.driver.findElement(By.id("name")).sendKeys(name)
    await this.driver.findElement(By.id("family_name")).sendKeys(family_name)
    await this.driver.sleep(5 * 1000)
  });

  this.When(/^preencher o telefone com "([^"]*)"$/,async function (phone_number) {
    await this.driver.findElement(By.id("phone_number")).sendKeys(phone_number)
    await this.driver.sleep(5 * 1000)
  });

  this.When(/^preencher as senhas com "([^"]*)" e "([^"]*)"$/,async function (password,confirm_password) {
    await this.driver.findElement(By.css(".VuePassword__Input > .form-control")).sendKeys(password)
    await this.driver.findElement(By.id("confirm_password")).sendKeys(confirm_password)
    await this.driver.sleep(5 * 1000)
  });

  this.When(/^remover o foco do campo senha$/, async function() {
    await this.driver.findElement(By.css(".step3-page > .row")).click();
  });
  
  this.Then(/^deverá visualizar senhas "([^"]*)"$/, async function(viewpassword) {
    await this.driver.sleep(5000);
    await this.driver.findElement(By.css(".VuePassword__Toggle__Icon > path")).click()
    await this.driver.sleep(5 * 1000)
    let currentValue = await this.driver.findElement(By.css(".VuePassword__Input > .form-control")).getAttribute('value')
    return assert.equal(currentValue,viewpassword);
  });

  this.When(/^finalizar sem aceitar os termos de uso$/, async function () {
    await this.driver.findElement(By.css(".btn")).click()
    await this.driver.sleep(5000)
  });

  this.Given(/^que eu conclua a etapa um$/,async function () {
    await this.driver.get("https://qa-web.tilix.com.br/cadastro/etapa-1");
    await this.driver.sleep(10 * 1000)
    await this.driver.findElement(By.id("email")).sendKeys("emailomeu@email.com");
    await this.driver.findElement(By.css(".btn-default")).click();
    await this.driver.sleep(10 * 1000)
    
  });

  this.Given(/^conclua a etapa dois$/, async function () {
    await this.driver.findElement(By.id("identifier")).sendKeys("01.409.580/0001-38");
    await this.driver.findElement(By.id("state")).click()
    {
      const dropdown = await this.driver.findElement(By.id("state"))
      await dropdown.findElement(By.xpath("//option[. = 'GO']")).click()
    }
    await this.driver.sleep(10 * 1000)
    await this.driver.findElement(By.css(".btn-default")).click();
    await this.driver.sleep(10 * 1000)
  });
  
  this.Given(/^conclua a etapa três$/, async function () {
    await this.driver.findElement(By.id("name")).sendKeys("Breno")
    await this.driver.findElement(By.id("family_name")).sendKeys("Borges")
    await this.driver.sleep(5000)
    await this.driver.findElement(By.id("phone_number")).sendKeys("62992594355")
    await this.driver.findElement(By.css(".VuePassword__Input > .form-control")).sendKeys("Kl902290")
    await this.driver.findElement(By.id("confirm_password")).sendKeys("Kl902290")
    await this.driver.sleep(5000)
    await this.driver.findElement(By.css(".checkmark")).click()
    await this.driver.sleep(5000)
    await this.driver.findElement(By.css(".btn")).click()
    await this.driver.sleep(5000)
  });

};
