# If not running interactively, don't do anything
[[ $- == *i* ]] || return

[ -n "$PS1" ]

# Load dotfiles:
for file in ~/.{bash_prompt,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

