
// Faster would be some sort of binary search to figure out where the target dates are.
// This does a linear search starting at the most recent.

// Also, this uses recursion, caching at each level. Extremely large commit histories
// could cause problems with stack depth and/or memory usage.

var core = require('thehelp-core');
var breadcrumbs = core.breadcrumbs;

var Repo = require('git').Repo;

// `getCommitsBetween` uses the `git` node module to pull a list of tags
// from the repository on disk.
exports.getCommitsBetween = function getCommitsBetween(location, checkAndAdd, end, cb) {
  if (!cb) {
    throw new Error('need to pass callback!');
  }
  if (!checkAndAdd) {
    return cb(new Error('need to pass checkAndAdd to repos!'));
  }
  if (!end) {
    return cb(new Error('need to provide end function!'));
  }

  var results = [];

  /*jshint nonew: false */
  new Repo(location, function(err, repo) {
    if (breadcrumbs.add(err, cb, {location: location})) {
      return;
    }

    var getCommits = repo.commits.bind(repo);
    exports.getCommitsBetweenInner(getCommits, 0, checkAndAdd, end, function(err) {
      if (breadcrumbs.add(err, cb, {location: location})) {
        return;
      };

      return cb();
    });
  });
};

exports.getCommitsBetweenInner = function getCommitsBetweenInner(getCommits, skip, checkAndAdd, end, cb) {
  // Repo.prototype.commits = function(start, max_count, skip, callback) {
  getCommits('master', 300, skip, function(err, commits) {
    if (breadcrumbs.add(err, cb)) {
      return;
    }

    if (!commits.length) {
      return cb();
    }

    for (var i = 0, max = commits.length; i < max; i += 1) {
      var commit = commits[i];

      checkAndAdd(commit);

      if (end(commit)) {
        return cb();
      }
    }

    getCommitsBetweenInner(getCommits, skip + i, checkAndAdd, end, cb);
  });
};
