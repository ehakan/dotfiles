# Integration setup for shell navigation tools

if status is-interactive
    if type -q zoxide
        zoxide init fish | source
    end

    if type -q yazi
        function y
            set tmp (mktemp -t "yazi-cwd.XXXXXX")
            command yazi $argv --cwd-file="$tmp"
            if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
                builtin cd -- "$cwd"
            end
            command rm -f -- "$tmp"
        end
    end

    if type -q eza
        abbr ll "eza -al"
    end
end
