// Sample script for testing docker container
// Writes a screenshot file
const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    executablePath: 'google-chrome-stable'
  });

  const page = await browser.newPage();
  await page.goto('https://justinribeiro.com');

  // /output should be bind mounted via --mount when running docker
  await page.screenshot({path: '/output/my-site-screenshot.png'});
  await browser.close();
})();