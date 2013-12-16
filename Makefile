all:
	cat lessc.inc.php | \
	sed 's/class lessc/class %BOOTCODE%_lessc/g' | \
	sed 's/class lessc_parser/class %BOOTCODE%_lessc_parser/g' | \
	sed 's/lessc::/%BOOTCODE%_lessc/g' | \
	sed 's/class lessc_formatter/class %BOOTCODE%_lessc_formatter/g' | \
	sed 's/extends lessc_formatter/extends %BOOTCODE%_lessc_formatter/g' | \
	sed 's/"%BOOTCODE%_lessc_formatter_lessjs"/"%BOOTCODE%_lessc_formatter_lessjs"/g' | \
	sed 's/"lessc_formatter_/%BOOTCODE%"lessc_formatter_/g' | \
	sed 's/new lessc_parser/new %BOOTCODE%_lessc_parser/g' | \
	sed 's/array("lessc"/array("%BOOTCODE%_lessc"/g' | \
	sed 's/array('\''lessc'\''/array('\''%BOOTCODE%_lessc'\''/g' \
	sed 's/protected function makeParser/public function makeParser/g' \
	sed 's/protected function findImport/public function findImport/g' \
	> ../../source/libraries/lessc.php

test:
	phpunit --colors tests

release:
	./package.sh