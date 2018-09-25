#!/bin/bash

rsync -avz  --exclude .git/ --exclude .gitignore /Users/lenny.low/ansible-playbooks/* /Users/lenny.low/llansible/
#rsync -avz /Users/lenny.low/ansible-playbooks/roles /Users/lenny.low/llansible/

