set fish_greeting

if test -f ~/.cache/wal/colors.fish
    source ~/.cache/wal/colors.fish
end

starship init fish | source
