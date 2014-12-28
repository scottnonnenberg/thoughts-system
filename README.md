# thoughts-system

This is my [system for keeping track of thoughts and goals](https://blog.scottnonnenberg.com/resolutions-and-systems/). Local text files, tracked with Git, easily scripted against. Journaling (or [morning pages](http://www.theguardian.com/lifeandstyle/2014/oct/03/morning-pages-change-your-life-oliver-burkeman)), a daily log of tasks and achievements (try using this as your 'home' page instead of your email inbox), weekly goals, and monthly reviews.

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

You should see a nice, new journal file with the day of the week and start time at the top. Add some of your thoughts. You might consider installing a word count tool in your editor of choice. Morning pages is often about three pages, or about 750 words.

Now you can start using some of the analysis tools. You'll need [`node.js`](http://nodejs.org/) installed to use them...

```bash
npm install

# how many days in a row of your journaled?
./streak

# what percentage of this year so far have you journaled?
./rateOfJournals
```

## All scripts:

* `commit.sh` - adds all changes in the repo and then commits it with the message 'autocommit for <date>'. I use this in a cron task to commit my changes every half-hour.
* `emotions` - uses the [Regressive Imagery Dictionary](http://enjoymentland.com/2010/01/11/the-regressive-imagery-dictionary/) ([via `ridict` node module](https://github.com/frankamp/node-ridict)) to analyze today's journal entry. Or, you can provide a path to a file as the first argument.
* `journal.sh` - generates a journal entry file for today an opens it, or opens today's if it already exists
* `log.sh` - generates a log file for today and opens it, or opens today's if it already exists
* `markov` - generates a markov chain-based gibberish string based on today's journal entry ([via `markov` node module](https://github.com/substack/node-markov))
* `month.sh` - generates a monthly review file for this month then opens it, or opens the existing file
* `rateOfJournals` - by default, calculates the percentage of journal entries so far this year. Use `--help` for more options.
* `streak` - starting with today's journal, looks at every day, counting backwards, until it finds a day with no journal. Then it reports the number of days with journals.
* `thisDayInHistory` - with no arguments, lists all the journals on this day of the year, as far back as 1997. Use `--help` for more options.
* `week.sh` - generates a weekly goals file and opens it, or generates a new one. If today is a monday, creates it for this week. If not, the weekly file for next week will be created.

## Other files:

* `info` - I use this for all sort of reference information. It starts with the three templates: `day.txt`, `week.txt`, `month.txt`
* `src` - javascript source
* `package.json` - node.js dependency list
* `thoughts.sublime-project` - if you use Sublime Text, this is a handy little starter project

## Lastly

This has been tested only on OSX with [Sublime Text](http://www.sublimetext.com/) as the editor. Happy hunting!

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

