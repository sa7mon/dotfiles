############################################
#                UI Changes                #
#                                          #
#      Black text on white backgroud       #
#              Shorten Prompt              #
############################################

$Shell = $Host.UI.RawUI

# $shell.BackgroundColor = "White"
# $shell.ForegroundColor = "Black"

## Change prompt bc it gets too long
function prompt { 
    "PS> "
}

############################################
#                  Aliases                 #
############################################

# Git 
function get-gitStatus { git status }
new-item alias:gs -value get-gitStatus
function get-gitFetch { git fetch }
new-item alias:gf -value get-gitFetch
#function set-gitCommit { & git commit -m $args }
#new-item alias:gc -value set-gitCommit
function set-gitAddAll {git add --all }
new-item alias:gaa -value set-gitAddAll
function set-gitReset { git reset }
new-item alias:gr -value set-gitReset
function get-gitDiff { git diff }
new-item alias:gd -value get-gitDiff
function get-gitBranch { git branch }
new-item alias:gb -value get-gitBranch

# FPX-Specific Stuff
function set-ignoreTestng { git update-index --skip-worktree C:\dev\cpq-test\testauto_ui\cpq\testNG.xml }
new-item alias:ignore-testng -value set-ignoreTestng
function get-client-clean-run { C:\Users\salmond\Documents\ClientClean\client-clean.bat }
new-item alias:cleanclient -value get-client-clean-run
function get-git-pull-origin-develop { git pull origin develop }
new-item alias:gpod -value get-git-pull-origin-develop
function get-killChrome { taskkill /f /im chromedriver.exe}
new-item alias:killchrome -value get-killChrome
new-item alias:cpq -value C:\dev\cpq-test\testauto_ui\cpq\src\com\fpx\test\cpq\ui

set-location C:\dev\cpq-test\testauto_ui\cpq\src\com\fpx\test\cpq\ui

# Everything else
function get-grep { & findstr $args}
new-item alias:grep -value get-grep
new-item alias:celar -value clear # celar -> clear
new-item alias:got -value git # got -> git

############################################
#                Do Git stuff              #
############################################

# Add Git tools to path
$env:path += ";C:\Program Files\Git\usr\bin"

# Import the ssh tools
. (Resolve-Path ~/Documents/WindowsPowershell/ssh-agent-utils.ps1)

# Add keys
Add-SshKey C:\Users\salmond\.ssh\github
Add-SshKey C:\Users\salmond\.ssh\id_rsa

#############################################
#          Clear it and we're done          #
#############################################
Clear-Host # Clear the screen