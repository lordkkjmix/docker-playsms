#!/bin/bash

exec /usr/local/bin/playsmsd start >/dev/null 2>&1
exec /usr/local/bin/playsmsd status >/dev/null 2>&1
