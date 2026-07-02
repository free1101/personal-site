const { DateTime } = require("luxon");

module.exports = function (eleventyConfig) {
  // Date formatting filter
  eleventyConfig.addFilter("formatDate", function (date) {
    return DateTime.fromJSDate(date).toFormat("yyyy-MM-dd");
  });

  // Sort posts by date descending (newest first)
  eleventyConfig.addCollection("posts", function (collectionApi) {
    return collectionApi.getFilteredByTag("posts").sort(function (a, b) {
      return b.date - a.date;
    });
  });

  return {
    dir: {
      input: "src",
      output: "_site",
    },
  };
};
