#!/bin/sh
_g(){
  if [ -d ./.git ]; then
    echo -e "\033[32mgit $@\033[37m"
    git $@
  else
    echo "Not a git repository"
  fi
}

g() {

if [ "$1" == "" ]; then
  _g

elif [ "$1" == "a" ]; then
  shift
  _g add $@

elif [ "$1" == "b" ]; then
  shift
  if [ "$1" == "" ]; then
    _g branch
  elif [ "$1" == "a" ]; then
    _g branch -a
  else
    _g branch $@
  fi

elif [ "$1" == "c" ]; then
  shift
  if [ "$1" == "m" ]; then
    shift
    if [ "$1" == "" ]; then
      _g checkout master
    else
      _g commit -m \"$@\"
    fi
  elif [ "$1" == "f" ]; then
    shift
    _g checkout feature/$@
  elif [ "$1" == "b" ]; then
    shift
    if [ "$1" == "f" ]; then
      shift
      _g checkout -b feature/$@
    else
      _g checkout -b $@
    fi
  else
    _g checkout $@
    #git checkout
  fi

elif [ "$1" == "d" ]; then
  shift
  _g diff $@

elif [ "$1" == "f" ]; then
  shift
  _g fetch $@

elif [ "$1" == "l" ]; then
  shift
  _g log $@

elif [ "$1" == "m" ]; then
  shift
  if [ "$1" == "m" ]; then
    _g merge master
  elif [ "$1" == "f" ]; then
    shift
    _g merge feature/$@
  else
    _g merge $@
  fi

elif [ "$1" == "p" ]; then
  shift
  if [ "$1" == "" ]; then
    _g pull
  elif [ "$1" == "r" ]; then
    _g pull --rebase
  elif [ "$1" == "o" ]; then
    shift
    if [ "$1" == "m" ]; then
      _g push origin master
    elif [ "$1" == "f" ]; then
      shift
      _g push origin feature/$@
    else
      _g push origin $@
    fi
  elif [ "$1" == "u" ]; then
    shift
    if [ "$1" == "o" ]; then
      shift
      if [ "$1" == "f" ]; then
        shift
        _g push -u origin feature/$@
      else
        _g push -u origin $@
      fi
    fi
  fi

elif [ "$1" == "r" ]; then
  shift
  if [ "$1" == "h" ]; then
    shift
    if [ "$1" == "h" ]; then
      _g reset HEAD^ --hard
    elif [ "$1" == "" ]; then
      _g reset HEAD^
    fi
  else
    _g reset $@
  fi

elif [ "$1" == "s" ]; then
  _g status

elif [ "$1" == "st" ]; then
  shift
  if [ "$1" == "a" ]; then
    _g stash apply
  else
    _g stash $@
  fi

elif [ "$1" == "unst" ]; then
  shift
  _g stash apply

elif [ "$1" == "v" ]; then
  _g version

#elif [ "$1" == "" ]; then

else
  _g $@

fi
}
