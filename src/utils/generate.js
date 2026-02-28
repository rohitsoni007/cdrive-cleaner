const fs = require("fs");
const Handlebars = require("handlebars");
const { TEMPLATE_PATH, OUTPUT_PATH, DATA_PATH } = require("./constant");

const generate = (type) => {
  if (!fs.existsSync("./bin")) {
    fs.mkdirSync("./bin");
  }
  if (fs.existsSync(OUTPUT_PATH[type])) {
    fs.rmSync(OUTPUT_PATH[type]);
  }

  const template = fs.readFileSync(TEMPLATE_PATH[type], "utf8");
  const compiled = Handlebars.compile(template);
  const data = JSON.parse(fs.readFileSync(DATA_PATH, "utf8"));
  const result = compiled(data);
  fs.writeFileSync(OUTPUT_PATH[type], result);
  console.log("Generated:", OUTPUT_PATH[type]);
};

module.exports = generate;
