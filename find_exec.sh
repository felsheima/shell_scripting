#!/bin/bash

find . -type f -size +200k -exec echo rm {} \;
