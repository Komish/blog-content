Title: Parsing Arguments in Code with argparse
Date: 2017-06-06 15:00
Category: Code
Tags: python, argparse
Slug: parsing-arguments-in-code-with-argparse
Authors: Jose R. Gonzalez
Summary: Parse arguments not necessarily passed in via the command line

Most people are probably familiar with using `argparse.ArgumentParser()` as a utility to pull information from a user via command line execution of a script. From what I can tell, this seems to parse the arguments as pulled in from `sys.argv` and do parsing based on that list of arguments.

```shell
$ ./test.py
Type of sys.argv <class 'list'>
Data of sys.argv ['./test.py']

$ ./test.py one two three
Type of sys.argv <class 'list'>
Data of sys.argv ['./test.py', 'one', 'two', 'three']

$ ./test.py -h hello -w world
Type of sys.argv <class 'list'>
Data of sys.argv ['./test.py', '-h', 'hello', '-w', 'world']
```

Then, performing the `parse_args()` on an `ArgumentParser()` object will result in a Namespace object containing the key-values as determined based on existing argument constructs, and the list contained in `sys.argv`.

With that said, there's nothing stopping you from passing a list into `parse_args()` once inside the script logic if you should find yourself needing to:

```python
>>> import sys
>>> from argparse import ArgumentParser
>>>
>>> parser = ArgumentParser()
>>> parser.add_argument('--test')
_StoreAction(option_strings=['--test'], dest='test', nargs=None, const=None, default=None, type=None, choices=None, help=None, metavar=None)
>>>
>>> args = [ '--test', 'hello' ]
>>>
>>> result = parser.parse_args(args)
>>>
>>> print(result)
Namespace(test='hello')
>>>
>>> args = [ '--test', 'world' ]
>>>
>>> result = parser.parse_args(args)
>>>
>>> print(result)
Namespace(test='world')
```

As mentioned before, in a command-line interface this doesn't pose much benefit. But in the event you were developing a shell interface to use, this might save some hassle in attempting to parse shell input.
