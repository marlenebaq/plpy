#!/bin/bash

# files=( *.pdf )
# echo "${files[@]%.pdf}"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
# TESTS_FAILED=()
NUM_FAILED=0
NUM_PASSED=0

test_against() {
	echo -e "Running: ${PURPLE}Set $1${NC}"
	echo -e "${CYAN}===================${NC}"
	for test_file in `ls -f *.pl`; do
		# echo -e "Running: ${CYAN}$test_file${NC}"
		perl ../../plpy.pl $test_file > tmp.py
		DIFF=$(diff tmp.py ${test_file[@]%.pl}.py)
		if [ "$DIFF" != "" ]; then
			echo -e "${RED} \xE2\x9C\x98 $test_file${NC}"
    		echo -e " There are differences between your and the sample output."
    		echo "  The diff (<yours, >theirs):"
    		diff tmp.py ${test_file[@]%.pl}.py # | colordiff
    		TESTS_FAILED[$NUM_FAILED]=$test_file
    		NUM_FAILED=$((NUM_FAILED + 1))
    	else
    		echo -e "${GREEN} \xE2\x9C\x94 $test_file${NC}"
			NUM_PASSED=$((NUM_PASSED + 1))
		fi
		rm tmp.py
	done

	if [ $NUM_FAILED -ne 0 ]; then
    	NUM_TESTS=$((NUM_FAILED + NUM_PASSED))
		echo -e "\n${RED}$NUM_FAILED out of $NUM_TESTS${NC} tests failed."
		echo "Failed tests: ${TESTS_FAILED[*]}\n"
	else
		echo -e "\n${GREEN}OK. $NUM_PASSED${NC} passed.\n"
	fi
}

for arg in "$@"; do
	cd $arg
	test_against $arg
	cd ..
done

# TODO: allow all arg