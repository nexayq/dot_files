# This is the custom theme template for gitprompt.sh
# Uplink: "https://github.com/magicmonty/bash-git-prompt"
# Copy this file to
    # "~/.git-prompt-colors.sh"

# examples in "~/.bash-git-prompt/themes"


# These are the defaults from the "Default" theme
# You just need to override what you want to have changed
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  function prompt_callback {
    local PS1="\u@\h: $(gp_truncate_pwd)"
    local PS1_user="\u@\h: "
    local PS1_dir="$(gp_truncate_pwd)"
    # gp_set_window_title "$PS1"
    gp_set_window_title "$PS1_user$PS1_dir"
    # echo -n "${BoldGreen}[${PS1}]${ResetColor}"
    echo -n "${BoldYellow}[${PS1_user}${BoldWhite}${PS1_dir}]${ResetColor}"
    # echo -n "[${PS1}]"
  }

  # Time12a="\$(date +%H:%M)"
  # PathShort="\w";
  PathShort="";

  ## These are the color definitions used by gitprompt.sh
  # GIT_PROMPT_PREFIX="["                 # start of the git info string
  # GIT_PROMPT_SUFFIX="]"                 # the end of the git info string
  # GIT_PROMPT_SEPARATOR="|"              # separates each item

  # GIT_PROMPT_BRANCH="${Magenta}"        # the git branch that is active in the current directory
  GIT_PROMPT_BRANCH="${BoldMagenta}"      # the git branch that is active in the current directory
  # GIT_PROMPT_STAGED="${Red}●"           # the number of staged files/directories
  # GIT_PROMPT_CONFLICTS="${Red}✖ "       # the number of files in conflict
  # GIT_PROMPT_CHANGED="${Blue}✚ "        # the number of changed files

  # GIT_PROMPT_REMOTE=" "                 # the remote branch name (if any) and the symbols for ahead and behind
  # GIT_PROMPT_UNTRACKED="${Cyan}…"       # the number of untracked files/dirs
  # GIT_PROMPT_STASHED="${BoldBlue}⚑ "    # the number of stashed files/dir
  # GIT_PROMPT_CLEAN="${BoldGreen}✔"      # a colored flag indicating a "clean" repo

  ## For the command indicator, the placeholder _LAST_COMMAND_STATE_
  ## will be replaced with the exit code of the last command
  ## e.g.
  ## GIT_PROMPT_COMMAND_OK="${Green}✔-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of 0
  ## GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of other than 0

  # GIT_PROMPT_COMMAND_OK="${Green}✔"    # indicator if the last command returned with an exit code of 0
  # GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_"    # indicator if the last command returned with an exit code of other than 0

  ## template for displaying the current virtual environment
  ## use the placeholder _VIRTUALENV_ will be replaced with
  ## the name of the current virtual environment (currently CONDA and VIRTUAL_ENV)
  # GIT_PROMPT_VIRTUALENV="(${Blue}_VIRTUALENV_${ResetColor}) "

  # template for displaying the current remote tracking branch
  # use the placeholder _UPSTREAM_ will be replaced with
  # the name of the current remote tracking branch
  # GIT_PROMPT_UPSTREAM=" {${Blue}_UPSTREAM_${ResetColor}}"

  ## _LAST_COMMAND_INDICATOR_ will be replaced by the appropriate GIT_PROMPT_COMMAND_OK OR GIT_PROMPT_COMMAND_FAIL
  GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${BoldYellow}${PathShort}${ResetColor}"
  # GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Yellow}${PathShort}${ResetColor}"
  # GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_ ${GIT_PROMPT_START_USER}"
  # GIT_PROMPT_END_USER=" \n${White}${Time12a}${ResetColor} $ "
  # GIT_PROMPT_END_ROOT=" \n${White}${Time12a}${ResetColor} # "

  ## Please do not add colors to these symbols
  # GIT_PROMPT_SYMBOLS_AHEAD="↑·"             # The symbol for "n versions ahead of origin"
  # GIT_PROMPT_SYMBOLS_BEHIND="↓·"            # The symbol for "n versions behind of origin"
  # GIT_PROMPT_SYMBOLS_PREHASH=":"            # Written before hash of commit, if no name could be found
  # GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="L" # This symbol is written after the branch, if the branch is not tracked
}

reload_git_prompt_colors "Custom"
