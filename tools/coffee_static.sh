#!/bin/sh
    # compile coffee
    echo `find .. -type f -name "*.coffee" | xargs coffee -c`
    # compile tpl
    echo `php staticCompile.php`

