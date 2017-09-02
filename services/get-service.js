module.exports = {
  getTestData: getTestData,
  sendResultsJson: sendResultsJson
};


function getTestData(req, res, next) {
  res.results = {
    successful: true,
    bestAnimal: 'pony'
  };

  next();
}

function sendResultsJson(req, res, next) {
  res.json(res.results);
}
