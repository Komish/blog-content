Title: On Deprecating Old Tools
Date: 2018-10-08 23:00
Category: Workstation
Tags: workstation, development
Slug: deprecating-old-tools
Authors: Jose
Summary: Find old versions of tools you've long since rebuilt is an interesting discovery process.

Lately I've found myself running through my personal workstation configuration-cleanings things up from well over a year of neglect. In that process, I've run into some old implementations of functionality I these days that I just failed to clean out of my `.bashrc` files. 

A while back I wrote about [Notetags](https://josegonzalez.io/simple-note-tagging-with-notetags.html), a simple Python utility script to help tag my own personal notes for better consumption and categorization. It's fairly straightforward-the user defines a tagging identifier and the script parses those and gives you a brief overview of the files containing a given tag. It's fairly bare-bones, but I believe that the best tool for the job does not necessarily drown the user in features and configuration, but rather gives the user freedom to consume the tooling while maintaining simplicity.

I discovered in my `.bash_profile` (in this case, on MacOS) an old version of this functionality made up of a few bash functions. Interestingly enough, I re-used enough of the same plumbing such that the functionality still seems to work even with the existing **Notetags** setup.

```bash
~~~ Basic Bash function `tags`
$ tags kubernetes
Substring Search for tags starting with kubernetes in notes:
/data/notes/kubernetes-notes.md TAGS: kubernetes k8s docker

~~~ Notetags implementation of the same
$ nt search kubernetes
=== Searching for tag containing: "kubernetes"
/data/notes/kubernetes-notes.md                                  TAGS:  docker k8s kubernetes
```

Obviously, I knew full-well that the Python implementation was unnecessary and often allow the simplest implementation that does the job live on. But at the time, the goal of **Notetags** was to solve an existing problem with Python... to solidify my Python knowledge. And at the end of the day, those projects are the best learning projects.

So with that in mind, the bash functions I had prepared before I pull this code out of my configuration:

```bash
~~~ source: .bash_profile
export NOTESDIR='/data/notes'

function taglist {
  echo -e "Listing ${PURPLE}all${NORMALIZE} tags for notes"
  echo -ne "${WHITE}" ; grep -R '^@@' "$NOTESDIR" | sort | uniq -c | awk -F: '{ print $2 }' | sed -e 's/@@//g'  | sort | uniq -c | column ; echo -e "${NORMALIZE}"
}

function tags {
  local SEARCH=$1;
  if [ ! -z "$SEARCH" ]; then
    echo -e "Substring Search for tags starting with ${PURPLE}$SEARCH${NORMALIZE} in notes:"
    FILELIST=$(grep -Roli "^@@${SEARCH}" $NOTESDIR) \
      && for FILE in $FILELIST; do
           TAGS_NOCOLOR=$(grep ^@@ "$FILE" | sed -e 's/@@//g' | tr '\n' ' ' | sort)
           TAGS=$(echo "${WHITE}${TAGS_NOCOLOR}" | sed -e "s/${SEARCH}/${SEARCH}/g")
           echo -e $(echo -e "${FILE}  ${WHITE}TAGS:${NORMALIZE} ${TAGS}${NORMALIZE}")
         done
  else
    echo -ne "${RED}ERROR${NORMALIZE} No search string provided. " \
      && taglist
  fi
}

function createnote {
  local NAME="$1"
  local NOTEPATH="$NOTESDIR"/"$NAME".md
  if [ ! -z "$NAME" ] && [ ! -f "$NOTEPATH" ]; then
      echo -e "\n\n\n@@TAGREMINDER" >> "$NOTEPATH" \
        && $EDITOR "$NOTEPATH" \
        && echo "Note saved."
  elif [ -f "$NOTEPATH" ]; then
    echo "Note already exists with this name" \
      && ls -l "$NOTEPATH"
  else
    echo "No name was provided, not creating note"
  fi
}
```

This is, of course, not the cleanest code as I'm not a bash scripting professional but it certainly got the job done. Looking at it now, I notice some oddities to get colorized output that aren't quite making it as output in my terminal today. Regardless, finding old fossils is always enjoyable.	