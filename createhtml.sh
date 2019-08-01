#!/bin/bash
title="My System Information"
cat <<- _EOF_ 
    <html>
        <head>
            <title>
           $title $PATH
            </title>
        </head>

        <body>
        <h1>$title $HOSTNAME</h1>
        </body>
        </html>
_EOF_
