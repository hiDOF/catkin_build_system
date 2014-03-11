DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

touch $DIR/catkin/test/CATKIN_IGNORE
touch $DIR/catkin_pkg/test/CATKIN_IGNORE
touch $DIR/catkin_simple/test/CATKIN_IGNORE

export PYTHONPATH=$DIR/catkin_pkg/src
export PATH=$DIR/catkin/bin:$PATH
