# thoughts-system

This is my [system for keeping track of thoughts and goals](https://blog.scottnonnenberg.com/resolutions-and-systems/). Local text files, tracked with git, and scripts to analyze/generate them (bash and node.js). All to support:

* journaling (or [morning pages](http://www.theguardian.com/lifeandstyle/2014/oct/03/morning-pages-change-your-life-oliver-burkeman))
* daily logs of tasks and achievements (try using this as your 'home' page instead of your email inbox)
* weekly goals
* monthly reviews

## Getting Started

First, fork this repo:

```bash
git clone git@github.com:scottnonnenberg/thoughts-system.git .
```

Then set your `EDITOR` environment variable, by putting something like this into your `~/.bashrc` or `~/.profile` (be sure to `source <filename>` for this terminal session if you make changes):

```bash
export EDITOR=subl
```

Now, start your first journal:

```bash
./journal.sh
```

You should see a nice, new journal file in your editor with the day of the week and start time at the top, generated to `YYYY/MM-MONTH/YYYYMMDD.txt`. Add some of your thoughts. You might consider installing a word count tool in your editor of choice. It is recommended that morning pages be about three pages, or about 750 words (thanks, [Buster](http://www.forbes.com/sites/jasonoberholtzer/2011/03/30/internet-transparency-a-chat-with-buster-benson/)).

Now you can start using some of the analysis tools. You'll need [`node.js`](http://nodejs.org/) installed to use them...

```bash
npm install

# how many days in a row of your journaled?
./streak

# what percentage of this year so far have you journaled?
./rateOfJournals
```

## Generation scripts:

* `log.sh` - generates a log file for today and opens it, or opens today's if it already exists
* `journal.sh` - generates a journal entry file for today an opens it, or opens today's if it already exists
* `week.sh` - generates a weekly goals file and opens it, or generates a new one. If today is a monday, creates it for this week. If not, the weekly file for next week will be created.
* `month.sh` - generates a monthly review file for this month then opens it, or opens the existing file

_Note: all of these but `week.sh` support a date as the first parameter, in the form `2014-06-23`_

## Analysis scripts:
* `streak` - (supports `--help`) starting with today's journal, looks at every day, counting backwards, until it finds a day with no journal. Then it reports the number of days with journals.
* `rateOfJournals` - (supports `--help`) by default, calculates the percentage of journal entries so far this year.
* `thisDayInHistory` - (supports `--help`) with no arguments, lists all the journals on this day of the year, as far back as 1997.
* `emotions` - uses the [Regressive Imagery Dictionary](http://enjoymentland.com/2010/01/11/the-regressive-imagery-dictionary/) ([via `ridict` node module](https://github.com/frankamp/node-ridict)) to analyze today's journal entry. Or, you can provide a path to a file as the first argument.
* `markov` - generates a markov chain-based gibberish string based on today's journal entry ([via `markov` node module](https://github.com/substack/node-markov))
* `dayOfWeekInHistory` - (supports `--help`) fun little script that tells you the day of week in history for this date
* `thisDayInCommits` - (supports `--help`) looks at the set of repos you provide via a config file for all commits from this day in history, by default filtered to your git user name. The config file should be an array of objects like this:

```JSON
[{
  "name": "Thoughts System",
  "location": "/Users/username/thoughts-system"
},{
  "name": "Other project",
  "location": "/Users/username/dev/other"
}]
```

## Other files:

* `commit.sh` - adds all changes in the repo and then commits it with the message 'autocommit for <date>'. I use this in a cron task to commit my changes every half-hour.
* `info` - I use this for all sort of reference information. It starts with the three templates: `day.txt`, `week.txt`, `month.txt`
* `src` - javascript source
* `package.json` - node.js dependency list
* `thoughts.sublime-project` - if you use Sublime Text, this is a handy little starter project

## Lastly

This has been tested only on OSX with [Sublime Text](http://www.sublimetext.com/) as the editor. Good luck elsewhere!

## License

MIT license

Copyright (c) 2014 Scott Nonnenberg <scott@nonnenberg.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

