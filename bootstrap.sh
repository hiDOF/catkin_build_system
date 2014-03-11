DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


if [ ! -f $DIR/catkin/bin/catkin_make_isolated ]; then
  echo -e "\e[1;31mDid you remember to initialize submodules?\e[0m"
  echo -e "\e[1;31mYou may need to do:\e[0m"
  echo -e "\e[1;31m  git submodule init\e[0m"
  echo -e "\e[1;31m  git submodule foreach git submodule init\e[0m"
  echo -e "\e[1;31m  git submodule update --recursive\e[0m"
fi

export PYTHONPATH=$DIR/catkin_pkg/src
export PATH=$DIR/catkin/bin:$PATH
