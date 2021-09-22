#!/bin/sh -e 

rm -rf dst/.files && ./ssg6 src dst 'bajac' 'http://www' && cd dst && python -m http.server 1234

