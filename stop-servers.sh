#!/bin/bash
ps aux | grep -E "flower-shop|nc " | awk '{print $2}' | xargs kill -9
