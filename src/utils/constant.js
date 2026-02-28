const DATA_PATH = "./src/data/clean.json";
const TEMPLATE = "./src/templates";
const OUTPUT = "bin";
const FAST_FILE = "ultra-clean-fast";
const PRO_FILE = "ultra-clean-pro";
const TEMPLATE_PATH = {
  FAST: `${TEMPLATE}/${FAST_FILE}.hbs`,
  PRO: `${TEMPLATE}/${PRO_FILE}.hbs`,
};
const OUTPUT_PATH = {
  FAST: `./${OUTPUT}/${FAST_FILE}.bat`,
  PRO: `./${OUTPUT}/${PRO_FILE}.bat`,
};

const FAST = "FAST";
const PRO = "PRO";

module.exports = { DATA_PATH, TEMPLATE_PATH, OUTPUT_PATH, FAST, PRO };
