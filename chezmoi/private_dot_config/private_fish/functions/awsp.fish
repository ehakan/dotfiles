function awsp --description 'Select an AWS profile with fzf and export AWS_PROFILE'
    set -l profile (aws configure list-profiles | fzf --prompt='AWS profile> ' --height=40% --reverse)

    if test -z "$profile"
        set -e AWS_PROFILE
        echo "awsp: no profile selected, AWS_PROFILE unset" >&2
        return 1
    end

    set -gx AWS_PROFILE $profile
    echo "AWS_PROFILE set to $profile"
end
