# Structure and Interpretation of Computer Programs

![workflow](https://github.com/shilgam/sicp/actions/workflows/ci.yml/badge.svg)

Solutions on SICP

## Prerequisites
- [Racket](https://download.racket-lang.org/)
## Usage

1. Go to projects directory

        $ cd src/exercises/github-actions-for-racket

1. Install dependencies

        $ raco pkg install --auto --batch

1. Execute file in interactive mode:

        $ racket -it fibonacci.rkt # run in interactive mode

        > (enter! "fibonacci.rkt") # load module

        > (stream->list (stream-take (fibs) 10))
        '(1 1 2 3 5 8 13 21 34 55)



### Run tests

1. Run tests

        $ cd src/exercises/github-actions-for-racket
        $ raco test fibonacci.rkt

## Notes
-  Books
    - EN: http://mitpress.mit.edu/sicp/
    - RU: http://newstar.rinet.ru/~goga/sicp/sicp.pdf
- Online Interpreter: https://repl.it/languages/Scheme
- Hexlet course: https://ru.hexlet.io/courses/sicp
