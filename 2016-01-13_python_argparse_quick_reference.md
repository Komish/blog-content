Title: Creating Command Line Arguments with Python and ArgParse
Date: 2016-01-13 10:20
Category: Python, Scripting
Tags: Python, Scripting
Slug: python-cli-argument-quick-reference
Authors: Jose R. Gonzalez
Summary: Quick Reference Sheet for creating common cli arguments in Python using the ArgParse library

Command-Line arguments are hugely beneficial in hacking away at scripts, as you get to specify behaviors and functionality that otherwise would require large amounts of logic. In Bash, you typically have a significant amount of logic as well just to get arguments parsed and working as you expect. Python and ArgParse, however, make it straight-forward but the documentation can be daunting. For your sanity (and mine), here's a quick reference for the most common cli arguments used.

First things first, of course you need to import the arparse library into your script. Once completed, you'll need to create a parser object:
```
parser = argparse.ArgumentParse(description="This is where your 
                    help text lives for your arguments. This gets 
                    displayed as a summary alongside your argument 
                    help text")
```

Pretty straight forward there, you'll return to this at the end of your argumenet logic to parse the responses and arguments passed by users of your script. Secondly, you'll define your arguments. Typically your arguments will fall under 3 categories.

### The Positional Argument ###

The positional argument is typically the minimal requirement for your script to function. In the case of coreutils' "cat" utility:

```
# cat filename.txt
```

In this case, filename.txt is your positional argument. A positional argument is not necessarily required; your script can run with no arguments except the option flags, however as with "cat" the positional argument does find itself used frequently. The syntax for creating one looks like the following:

```
parser.add_argument('argument_name',
                    help="Helpful output in describing the 
                    purpose of this argument to the user.")
```

Notice the help text, which is presented to the user during a -h or --help flag execution to lead them in the right direction. Using this syntax, this argument is a required argumente in order for script functionality to take place.

### Short and Long Flags ###

The second most common case to add functionality to a script is to provide an option or flag as a part of your script functionality. In this case, we'll take an example of a flag that requires an argument:

```
parser.add_argument('-u', '--username',
                    help="Username to use for your scripts purposes")
```

Again, notice the help text that is provided during a -h or --help flag to lead your user in the right direction. In this particular case, you can opt to omit the long or short flag, and leave ONLY the remaining flag for use by the end user.

In addition, you can specify a default value that can be assigned to this a flag. If the flag is not specified by the user during command execution, the behavior or result of the argument is a **NoneType** when evaluated. If you wish to provide a default, just utilize the following additional parameter:

```
parser.add_argument('-u', '--username', default='root',
                    help="Username to use for your scripts purposes")
``` 

Instead of the **NoneType** response, you will see 'root' as the resulting value to this argument if the argument is not specified.

Additionally, you can specify a boolean behavior if a flag is called which can be useful in situations where you need to enable or disable a feature (think debug flags or script verbosity). See the following syntax:

```
parser.add_argument('--debug', action="store_true",
                    help="Enables debug output")
```

This flag, when called, will return a boolean result which can be evaluated and change the action of your script as you see fit.

### Evaluating Options ###

Once the argument definitions have been added to your script, you need to create the resulting object of the passed arguments to your script.
```
args = parser.parse_args()
```

From here, you can call the evaluated arguments based on the naming conventions used in your script. As an example case:
```
> resulting_username = args.username
> print(resulting_username)
root
> debug_enabled = args.debug
> print(str(debug_enabled))
True
```

This functionality is infinitely extensible, but this is typically enough for your average 'hackaday' script. Enjoy!

