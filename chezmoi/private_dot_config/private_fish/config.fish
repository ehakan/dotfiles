if status is-interactive
    if type -q nvim
        set -gx EDITOR nvim
        set -gx VISUAL nvim
    end
end
