# Help

## Running the tests

If you have the phix binary on your path, enter the command:

```bash
p test 
```
This will run the test file (test.exw).

If the phix binary is not on the PATH, in Windows enter

```cmd
\path\to\p.exe test
```

Linux:

```bash
/path/to/p test
```

## Skipped tests

Solving an exercise means making all its tests pass.
By default, all the tests in the test.exw file are executed.
To skip a test, prepend two dashes (the standard Phix comment marker) to the beginning of the line.

Note the tests do not honour any include=false flags in tests.toml, rather it is the responsibility
of the test.exw author to maintain them manually in that file to reflect reality for the benefit of
the exercism site (eg collecting track statistics), but nothing in the track itself makes any use
of them at all, specifically including the test generator and the test runner.

## Submitting your solution

You can submit your solution using the `exercism submit hello-world.e` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [Phix track's documentation](https://exercism.org/docs/tracks/phix)
- The [Phix track's programming category on the forum](https://forum.exercism.org/c/programming/phix)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

## Useful Resources

If you need some help see:

* [The Euphoria Forum](https://openeuphoria.org/forum/index.wc),
* [The Phix Manual](http://phix.x10.mx/docs/html/phix.htm).