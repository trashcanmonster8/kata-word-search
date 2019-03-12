# kata-word-search

- [kata-word-search](#kata-word-search)
  - [Kata](#kata)
  - [Development](#development)
    - [Installation](#installation)
    - [Rake Tasks](#rake-tasks)
      - [Unit tests](#unit-tests)
      - [Ruby Style](#ruby-style)
  - [Usage](#usage)
    - [Example 1](#example-1)
    - [Example 2](#example-2)

## Kata

See [here](https://github.com/PillarTechnology/kata-word-search).

**Summary:** Given a text file consisting of a list of words, and a series of rows of single-character lists representing the word search grid, this program should search for the words in the grid and return a set of x,y coordinates for each word found.

## Development

Developed on `Ruby v2.5` and is expecting `ruby ~>2.5`. See [Gemfile](Gemfile).

### Installation

Install necessary packages for development using `bundler`.

```bash
$ bundle install
```

### Rake Tasks

Development tasks are handle by [Rake](https://ruby.github.io/rake/) and configured in the [Rakefile](Rakefile). To see all avaliable rake tasks run:

```bash
$ rake -T
```

#### Unit tests

Unit tests are developed in [RSpec](http://rspec.info/). To run tests, run the following command:

```bash
$ rake spec
```

`RSpec` default command line arguments are managed by [.rspec](.rspec) file.

#### Ruby Style

[Rubocop](https://rubocop.readthedocs.io/en/latest/) maintains compliance to the [ruby style guide](https://github.com/rubocop-hq/ruby-style-guide). To see styles that need correction run:

```bash
$ rake rubocop
```

`Rubocop` has an auto correct feature to fix styles that don't affect the behavior of the code. To use this feature run:

```bash
$ rake rubocop:auto_correct
```

`Rubocop` is configured by [.rubocop.yml](.rubocop.yml).

## Usage

To run the application, run the executable [bin/word_search](bin/word_search) with one argument being the path to the word search file. For example:

| _Linux_                           | _Windows_                          |
|-----------------------------------|------------------------------------|
| `$ ./bin/word_search example.txt` | `> bin\word_search.bat example.txt`|

The repo contains two example puzzles, one from the [original kata](https://github.com/PillarTechnology/kata-word-search#input) and a custom problem. Here is the original [problem](puzzles/puzzle_one.txt) and [solution](puzzles/solution_one.txt). The second problem is [here](puzzles/puzzle_two.txt) with [solution](puzzles/solution_two.txt).

The examples assume you are in the project's directory to execute. This does not install any commands on the system's `PATH`.

### Example 1

```bash
$ <project_dir>/bin/word_search puzzles/puzzle_one.txt

KHAN: (5,9),(5,8),(5,7),(5,6)
KIRK: (4,7),(3,7),(2,7),(1,7)
SCOTTY: (0,5),(1,5),(2,5),(3,5),(4,5),(5,5)
SPOCK: (2,1),(3,2),(4,3),(5,4),(6,5)
SULU: (3,3),(2,2),(1,1),(0,0)
UHURA: (4,0),(3,1),(2,2),(1,3),(0,4)
```

### Example 2

```bash
$ <project_dir>/bin/word_search puzzles/puzzle_two.txt

BOHR: (21,15),(21,14),(21,13),(21,12)
EINSTEIN: (26,6),(26,7),(26,8),(26,9),(26,10),(26,11),(26,12),(26,13)
FEYNMAN: (19,3),(18,4),(17,5),(16,6),(15,7),(14,8),(13,9)
HAWKING: (21,13),(22,13),(23,13),(24,13),(25,13),(26,13),(27,13)
NEWTON: (16,6),(16,7),(16,8),(16,9),(16,10),(16,11)
RUTHERFORD: (22,4),(21,4),(20,4),(19,4),(18,4),(17,4),(16,4),(15,4),(14,4),(13,4)
SCHRODINGER: (17,2),(18,3),(19,4),(20,5),(21,6),(22,7),(23,8),(24,9),(25,10),(26,11),(27,12)
```
