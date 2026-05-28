# Shell prompt integrations

if status is-interactive
    if type -q starship
        set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
        starship init fish | source
    end
end
