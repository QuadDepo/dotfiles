# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@";
  else
    du $arg .[^.]* *;
  fi;
}

# Use locally installed Node
function ne() {
   $(npm bin)/$@
}

# Simple calculator
function calc() {
  local result="";
  result="$(printf "scale=10;$*\n" | bc --mathlib | tr -d '\\\n')";
  #                       └─ default (when `--mathlib` is used) is 20
  #
  if [[ "$result" == *.* ]]; then
    # improve the output for decimal numbers
    printf "$result" |
    sed -e 's/^\./0./'        `# add "0" for cases like ".5"` \
        -e 's/^-\./-0./'      `# add "0" for cases like "-.5"`\
        -e 's/0*$//;s/\.$//';  # remove trailing zeros
  else
    printf "$result";
  fi;
  printf "\n";
}

# Rename current branch
function rename_branch() {
  # Get the current branch name
  local current_branch=$(git branch --show-current)

  # Check if we're on a valid branch
  if [[ -z "$current_branch" ]]; then
    echo "Error: Unable to determine the current branch."
    return 1
  fi

  # Display current branch and prompt for the new branch name
  echo "Current branch: $current_branch"
  read -p "Enter the new branch name: " new_name

  # Validate the new branch name
  if [[ -z "$new_name" ]]; then
    echo "Error: Branch name cannot be empty."
    return 1
  fi

  # Rename the current branch
  git branch -m "$new_name"

  # Confirm the renaming
  echo "Branch '$current_branch' has been renamed to '$new_name'."
}
