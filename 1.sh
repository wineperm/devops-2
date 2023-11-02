#!/bin/bash
while ((1==1))
do
        curl http://ya.ru
        if (($? != 0))
        then
                date > curl.log
        else
                echo site is available!
        fi
done
