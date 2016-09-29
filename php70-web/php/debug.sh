#!/bin/bash
PHP_IDE_CONFIG="serverName=localhost" XDEBUG_CONFIG="idekey=PHPSTORM remote_host=172.17.0.1 profiler_enable=1 remote_enable=1" php $@
